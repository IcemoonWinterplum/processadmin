<?php

error_reporting(E_ALL ^ E_NOTICE);

ob_implicit_flush();

 

//��ַ��ӿڣ�������socketʱ��Ҫ��������IP�Ͷ˿�

$sk=new Sock('127.0.0.1',8000);

 

//�Դ�����socketѭ�����м�������������

$sk->run();

 

//������sock��

class Sock{

    public $sockets; //socket�����ӳأ���client���ӽ�����socket��־

    public $users;   //����client���ӽ�������Ϣ������socket��client���ֵ�

    public $master;  //socket��resource����ǰ�ڳ�ʼ��socketʱ���ص�socket��Դ

     

    private $sda=array();   //�ѽ��յ�����

    private $slen=array();  //�����ܳ���

    private $sjen=array();  //�������ݵĳ���

    private $ar=array();    //����key

    private $n=array();

     

    public function __construct($address, $port){

 

        //����socket���ѱ���socket��Դ��$this->master

        $this->master=$this->WebSocket($address, $port);

 

        //����socket���ӳ�

        $this->sockets=array($this->master);

    }

     

    //�Դ�����socketѭ�����м�������������

    function run(){

        //��ѭ����ֱ��socket�Ͽ�

        while(true){

            $changes=$this->sockets;

            $write=NULL;

            $except=NULL;

             

            /*

            //���������ͬʱ���ܶ�����ӵĹؼ����ҵ��������Ϊ�����������������ִ�С�

            socket_select ($sockets, $write = NULL, $except = NULL, NULL);

 

            $sockets�������Ϊһ�����飬��������д�ŵ����ļ��������������б仯������������Ϣ�������пͻ�������/�Ͽ���ʱ��socket_select�����Ż᷵�أ���������ִ�С�

            $write�Ǽ����Ƿ��пͻ���д���ݣ�����NULL�ǲ������Ƿ���д�仯��

            $except��$sockets����Ҫ���ų���Ԫ�أ�����NULL�ǡ�������ȫ����

            ���һ�������ǳ�ʱʱ��

            ���Ϊ0������������

            ���Ϊn>1: �������n������������ĳһ���������¶�̬������ǰ����

            ���Ϊnull������ĳһ���������¶�̬���򷵻�

            */

            socket_select($changes,$write,$except,NULL);

            foreach($changes as $sock){

                 

                //������µ�client���ӽ�������

                if($sock==$this->master){

 

                    //����һ��socket����

                    $client=socket_accept($this->master);

 

                    //�������ӽ�����socketһ��Ψһ��ID

                    $key=uniqid();

                    $this->sockets[]=$client;  //�������ӽ�����socket������ӳ�

                    $this->users[$key]=array(

                        'socket'=>$client,  //��¼�����ӽ���client��socket��Ϣ

                        'shou'=>false       //��־��socket��Դû���������

                    );

                //����1.Ϊclient�Ͽ�socket���ӣ�2.client������Ϣ

                }else{

                    $len=0;

                    $buffer='';

                    //��ȡ��socket����Ϣ��ע�⣺�ڶ������������ô��μ��������ݣ������������ǽ������ݵĳ���

                    do{

                        $l=socket_recv($sock,$buf,1000,0);

                        $len+=$l;

                        $buffer.=$buf;

                    }while($l==1000);

 

                    //����socket��user�����������Ӧ��$k,����ID

                    $k=$this->search($sock);

 

                    //������յ���Ϣ����С��7�����client��socketΪ�Ͽ�����

                    if($len<7){

                        //����client��socket���жϿ�����������$this->sockets��$this->users�������ɾ��

                        $this->send2($k);

                        continue;

                    }

                    //�жϸ�socket�Ƿ��Ѿ�����

                    if(!$this->users[$k]['shou']){

                        //���û�����֣���������ִ���

                        $this->woshou($k,$buffer);

                    }else{

                        //�ߵ�������Ǹ�client������Ϣ�ˣ��Խ��ܵ�����Ϣ����uncode����

                        $buffer = $this->uncode($buffer,$k);

                        if($buffer==false){

                            continue;

                        }

                        //�����Ϊ�գ��������Ϣ���Ͳ���

                        $this->send($k,$buffer);

                    }

                }

            }

             

        }

         

    }

     

    //ָ���ر�$k��Ӧ��socket

    function close($k){

        //�Ͽ���Ӧsocket

        socket_close($this->users[$k]['socket']);

        //ɾ����Ӧ��user��Ϣ

        unset($this->users[$k]);

        //���¶���sockets���ӳ�

        $this->sockets=array($this->master);

        foreach($this->users as $v){

            $this->sockets[]=$v['socket'];

        }

        //�����־

        $this->e("key:$k close");

    }

     

    //����sock��users���������Ӧ��$k

    function search($sock){

        foreach ($this->users as $k=>$v){

            if($sock==$v['socket'])

            return $k;

        }

        return false;

    }

     

    //����Ӧ��IP��˿ڽ��д���socket����

    function WebSocket($address,$port){

        $server = socket_create(AF_INET, SOCK_STREAM, SOL_TCP);

        socket_set_option($server, SOL_SOCKET, SO_REUSEADDR, 1);//1��ʾ�������е����ݰ�

        socket_bind($server, $address, $port);

        socket_listen($server);

        $this->e('Server Started : '.date('Y-m-d H:i:s'));

        $this->e('Listening on   : '.$address.' port '.$port);

        return $server;

    }

     

     

    /*

    * ����˵������client��������л�Ӧ�������ֲ���

    * @$k clien��socket��Ӧ�Ľ�����ÿ���û���Ψһ$k����Ӧsocket

    * @$buffer ����client�����������Ϣ

    */

    function woshou($k,$buffer){

 

        //��ȡSec-WebSocket-Key��ֵ�����ܣ�����$key�����һ����258EAFA5-E914-47DA-95CA-C5AB0DC85B11�ַ���Ӧ���ǹ̶���

        $buf  = substr($buffer,strpos($buffer,'Sec-WebSocket-Key:')+18);

        $key  = trim(substr($buf,0,strpos($buf,"\r\n")));

        $new_key = base64_encode(sha1($key."258EAFA5-E914-47DA-95CA-C5AB0DC85B11",true));

         

        //����Э�������Ϣ���з���

        $new_message = "HTTP/1.1 101 Switching Protocols\r\n";

        $new_message .= "Upgrade: websocket\r\n";

        $new_message .= "Sec-WebSocket-Version: 13\r\n";

        $new_message .= "Connection: Upgrade\r\n";

        $new_message .= "Sec-WebSocket-Accept: " . $new_key . "\r\n\r\n";

        socket_write($this->users[$k]['socket'],$new_message,strlen($new_message));

 

        //���Ѿ����ֵ�client����־

        $this->users[$k]['shou']=true;

        return true;

         

    }

     

    //���뺯��

    function uncode($str,$key){

        $mask = array(); 

        $data = ''; 

        $msg = unpack('H*',$str);

        $head = substr($msg[1],0,2); 

        if ($head == '81' && !isset($this->slen[$key])) { 

            $len=substr($msg[1],2,2);

            $len=hexdec($len);//��ʮ�����Ƶ�ת��Ϊʮ����

            if(substr($msg[1],2,2)=='fe'){

                $len=substr($msg[1],4,4);

                $len=hexdec($len);

                $msg[1]=substr($msg[1],4);

            }else if(substr($msg[1],2,2)=='ff'){

                $len=substr($msg[1],4,16);

                $len=hexdec($len);

                $msg[1]=substr($msg[1],16);

            }

            $mask[] = hexdec(substr($msg[1],4,2)); 

            $mask[] = hexdec(substr($msg[1],6,2)); 

            $mask[] = hexdec(substr($msg[1],8,2)); 

            $mask[] = hexdec(substr($msg[1],10,2));

            $s = 12;

            $n=0;

        }else if($this->slen[$key] > 0){

            $len=$this->slen[$key];

            $mask=$this->ar[$key];

            $n=$this->n[$key];

            $s = 0;

        }

         

        $e = strlen($msg[1])-2;

        for ($i=$s; $i<= $e; $i+= 2) { 

            $data .= chr($mask[$n%4]^hexdec(substr($msg[1],$i,2))); 

            $n++; 

        } 

        $dlen=strlen($data);

         

        if($len > 255 && $len > $dlen+intval($this->sjen[$key])){

            $this->ar[$key]=$mask;

            $this->slen[$key]=$len;

            $this->sjen[$key]=$dlen+intval($this->sjen[$key]);

            $this->sda[$key]=$this->sda[$key].$data;

            $this->n[$key]=$n;

            return false;

        }else{

            unset($this->ar[$key],$this->slen[$key],$this->sjen[$key],$this->n[$key]);

            $data=$this->sda[$key].$data;

            unset($this->sda[$key]);

            return $data;

        }

         

    }

     

    //��uncode���

    function code($msg){

        $frame = array(); 

        $frame[0] = '81'; 

        $len = strlen($msg);

        if($len < 126){

            $frame[1] = $len<16?'0'.dechex($len):dechex($len);

        }else if($len < 65025){

            $s=dechex($len);

            $frame[1]='7e'.str_repeat('0',4-strlen($s)).$s;

        }else{

            $s=dechex($len);

            $frame[1]='7f'.str_repeat('0',16-strlen($s)).$s;

        }

        $frame[2] = $this->ord_hex($msg);

        $data = implode('',$frame); 

        return pack("H*", $data); 

    }

     

    function ord_hex($data)  { 

        $msg = ''; 

        $l = strlen($data); 

        for ($i= 0; $i<$l; $i++) { 

            $msg .= dechex(ord($data{$i})); 

        } 

        return $msg; 

    }

     

    //�û������client������Ϣ

    function send($k,$msg){

        //����ѯ�ַ����������ڶ������������У����������ʽ�����磺parse_str("name=Bill&age=60",$arr)

        parse_str($msg,$g);

        $ar=array();

 

        if($g['type']=='add'){

            //��һ�ν�������������֣���������������Ӧ��users����

            $this->users[$k]['name']=$g['ming'];

            $ar['type']='add';

            $ar['name']=$g['ming'];

            $key='all';

        }else{

            //������Ϣ��Ϊ������$g['key']��ʾ��Դ�һ��Ǹ��ˣ���ǰ�δ���������Ϣ

            $ar['nrong']=$g['nr'];

            $key=$g['key'];

        }

        //������Ϣ

        $this->send1($k,$ar,$key);

    }

     

    //���¼����client�����Ѿ����ߵ�client

    function getusers(){

        $ar=array();

        foreach($this->users as $k=>$v){

            $ar[]=array('code'=>$k,'name'=>$v['name']);

        }

        return $ar;

    }

     

    //$k ����Ϣ�˵�socketID $key�����˵� socketID ���������socketID���Բ�����Ӧ��client������Ϣ���ͣ���ָ��client���з���

    function send1($k,$ar,$key='all'){

        $ar['code1']=$key;

        $ar['code']=$k;

        $ar['time']=date('m-d H:i:s');

        //�Է�����Ϣ���б��봦��

        $str = $this->code(json_encode($ar));

        //��Դ�Ҽ����������߷�����Ϣ

        if($key=='all'){

            $users=$this->users;

            //�����add��ʾ�¼ӵ�client

            if($ar['type']=='add'){

                $ar['type']='madd';

                $ar['users']=$this->getusers();        //ȡ�����������ߣ�������ʾ�������û��б���

                $str1 = $this->code(json_encode($ar)); //��������client���б��봦�����ݲ�һ��

                //����client�Լ��������ͣ���Ϊ��Щ�����ǲ�һ����

                socket_write($users[$k]['socket'],$str1,strlen($str1));

                //�����Ѿ���client�Լ��������͵ģ�����������ٴη��ͣ���unset

                unset($users[$k]);

            }

            //������client�⣬������client���з�����Ϣ����������ʱ����Ҫ������ʱ��������

            foreach($users as $v){

                socket_write($v['socket'],$str,strlen($str));

            }

        }else{

            //�����Ը��˷�����Ϣ����˫������

            socket_write($this->users[$k]['socket'],$str,strlen($str));

            socket_write($this->users[$key]['socket'],$str,strlen($str));

        }

    }

     

    //�û��˳�������client������Ϣ

    function send2($k){

        $this->close($k);

        $ar['type']='rmove';

        $ar['nrong']=$k;

        $this->send1(false,$ar,'all');

    }

     

    //��¼��־

    function e($str){

        //$path=dirname(__FILE__).'/log.txt';

        $str=$str."\n";

        //error_log($str,3,$path);

        //���봦��

        echo iconv('utf-8','gbk//IGNORE',$str);

    }

}

?>