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
	
	/**
	* @Route("/indication/creer", name="creer"
	*/
	public function creerIndication(Request $request)
	{
		$repository=$this->getDoctrine()->getRepository(Indication::class);
		$em=$this->getDoctrine()->getManager();
		$ndication=new Indication();
		$form= $this->createForm(IndicationType::class, $indication);
				   $form->handleRequest($request);
					if($form->isSubmitted() && $form->isValid()) {
						$indication = $form->getData();
						$em=$this->getDoctrine()->getManager();
						$em->persist($indication);
						$em->flush(); 
			return $this->redirectToRoute('indications');
		}
						return $this->render('indications/formAdherent.html.twig',[
		'form'=>$form->createView(),]);
	
	}
	
}
