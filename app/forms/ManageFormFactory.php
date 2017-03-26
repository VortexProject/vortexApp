<?php

namespace App\Forms;

use Nette;
use App\Model;
use Nette\Application\UI\Form;
use Tracy\Debugger;


class ManageFormFactory extends Nette\Object
{

    /** @var FormFactory */
    private $formFactory;


    /** @var string */
    private $action;

	public function __construct(FormFactory $formFactory)
	{
        $this->formFactory = $formFactory;
	}

    private function setAction($action)
    {
        $this->action = strtolower($action);
    }

    /**
     * @param $action
     * @param string $country
     * @return Form
     */
	public function create($action)
	{

        $this->setAction($action);
        $form = $this->formFactory->create();
        $form->addProtection('Vypršel časový limit, odešlete formulář znovu');
        
        $form->addText("pointsForm", "Add users's points")
            ->setRequired("Enter points");

        $form->addSubmit("Save", "Save");
        return $form;
	}



}
