<?php

declare(strict_types=1);

namespace Application\Controller;

use Application\Controller\AbstractController;
use Application\Form\ContactForm;
use Laminas\View\Model\ViewModel;

class IndexController extends AbstractController
{

    public function indexAction()
    {
        return $this->view;
    }
    public function contactAction()
    {
        $form = new ContactForm('contact-us');

        // do some work
        

        $this->view->setVariable('form', $form);
        return $this->view;
    }
    public function forbiddenAction()
    {
        $this->response->setStatusCode(403);
        return new ViewModel();
    }
}
