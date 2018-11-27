<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Indication;

class IndicationController extends AbstractController
{
    /**
     * @Route("/indication", name="indication")
     */
    public function index()
    {
		$repository=$this->getDoctrine()->getRepository(Indication::class);
		$uneIndication = new Indication();
		
			$lesIndications=$repository->findAll();
		return $this->render('indication/index.html.twig',['indications'=>$lesIndications]);

    }
}
