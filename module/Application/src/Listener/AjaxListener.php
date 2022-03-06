<?php
namespace Application\Listener;

use Laminas\EventManager\AbstractListenerAggregate;
use Laminas\EventManager\EventManagerInterface;
use Laminas\Mvc\MvcEvent;

class AjaxListener extends AbstractListenerAggregate
{
    public function __construct() {}

    public function attach(EventManagerInterface $events, $priority = 1)
    {
        $this->listeners[] = $events->attach(
            MvcEvent::EVENT_RENDER,
            [$this, 'setTerminal'],
            $priority
        );
    }
    public function setTerminal(MvcEvent $event) : void
    {
        // Get root view model
        $layoutViewModel = $event->getViewModel();
        $layoutViewModel->setTerminal(true);
        // Rendering without layout? if so then there is nothing more to do
        if ($layoutViewModel->terminate()) {
            return;
        }
        // Get an instance of the Request Object from the EvenManager
        /**
         * @var \Laminas\Http\PhpEnvironment\Request
         */
        $request = $event->getRequest();
        if($request->isXmlHttpRequest())
        {
            //$contentModel[0] should be the model were looking for
            $layoutViewModel->setTerminal(true);
        }
    }
}