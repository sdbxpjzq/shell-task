<?php

interface Proto
{
    function conn($url);

    function get();

    function post();

    function close();
}

class Http implements Proto
{
    protected $url = '';
    protected $host = '';
    protected $port = '';
    protected $path = '';
    protected $header = '';
    protected $res = '';
    protected $fh = null;

    public function __construct($url)
    {
        $this->url = $url;
        $this->conn($this->url);
    }

    protected function parseUrl($url)
    {
        $url = parse_url($url);
        $this->host = $url['host'];
        $this->port = $url['port'] ?: 80;
        $this->path = $url['path'];
    }

    protected function setHttpHeader($url)
    {
        $this->parseUrl($url);
        $arr = [
            'Get ' . $this->path . ' HTTP/1.1',
            'Host: ' . $this->host,
            "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36",
            '',
            '',
        ];
        $str = implode(PHP_EOL, $arr);
        print_r($str);
        $this->header = $str;
    }


    function conn($url)
    {
        $this->setHttpHeader($url);
        $this->fh = fsockopen($this->host, $this->port);
        fwrite($this->fh, $this->header);
        while (!feof($this->fh)) {
            $this->res .= fread($this->fh, 1024);
        }
        print_r($this->res);
        $this->close();
    }

    function get()
    {
        // TODO: Implement get() method.
    }

    function post()
    {
        // TODO: Implement post() method.
    }

    function close()
    {
        fclose($this->fh);
    }

}

$url = 'http://news.cctv.com/2019/08/31/ARTIvGMHNIJHlwChPCuyYtHg190831.shtml';
new Http($url);


