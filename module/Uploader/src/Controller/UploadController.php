<?php
declare(strict_types=1);
namespace Uploader\Controller;
use Laminas\Mvc\Controller\AbstractActionController;
use Laminas\View\Model\ViewModel;
use Uploader\Uploader;
class UploadController extends AbstractActionController
{
    public function __construct(Uploader $uploader)
    {
        $this->uploader = $uploader;
        $this->view = new ViewModel();
        $this->view->setTerminal(true);
    }
    public function adminUploadAction()
    {
            // $uploader = $this->sm->get(UtilsImageUploader::class);
            if($this->request->isXmlHttpRequest()) {
                $ajax = true;
            }
            if ($this->request->isPost()) {
                
                $data =  array_merge_recursive($this->request->getPost()->toArray(), $this->request->getFiles()->toArray());
                // do we have a valid module name in the post data, its required!!!!!
                if(!isset($data['module'])) {
                    //return $this->response->setStatusCode(500);
                }
                // maybe this needs to be refactored to something more like... setRunTimeConfig($post['upload-config'])
                $this->uploader->setData($data);
                /// The following signature needs to be changed, should not have to pass data here
                $this->uploader->upload();
                $data = ['location' => $this->uploader->getPublicPath()];
                $this->view->setVariable('data', $data);
               
            }
            return $this->view;
    }
    public function userUploadAction()
    {

    }
    public function progressAction()
    {
        
    }
}