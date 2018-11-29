<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Indication;
use App\Form\IndicationType;
use Symfony\Component\HttpFoundation\Request;

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
	* @Route("/indication/creer", name="creer")
	*/
	public function creerIndication(Request $request)
	{
		$repository=$this->getDoctrine()->getRepository(Indication::class);
		$em=$this->getDoctrine()->getManager();
		$indication=new Indication();
		$form= $this->createForm(IndicationType::class, $indication);
				   $form->handleRequest($request);
					if($form->isSubmitted() && $form->isValid()) {
						$indication = $form->getData();
						$em=$this->getDoctrine()->getManager();
						$em->persist($indication);
						$em->flush(); 
			return $this->redirectToRoute('/indication');
		}
						return $this->render('indication/formIndication.html.twig',[
		'form'=>$form->createView(),]);
	
	}
	
	/**
	*@route("/indication/modifier/{id}", name="modifier")
	*/
	public function modifierIndication($id, Request $request)
	{
		$repository=$this->getDoctrine()->getRepository(Indication::class);
		$em=$this->getDoctrine()->getManager();
		$uneIndication = $repository->find($id);
		echo "Vous allez modifier l'Indication d'id : ".$id;
		$form= $this->createForm(IndicationType::class, $uneIndication);
					   
			
		 $form->handleRequest($request);
		if($form->isSubmitted() && $form->isValid())
		{	
			$uneIndication = $form->getData();
			$em=$this->getDoctrine()->getManager();
			$em->persist($uneIndication);
			$em->flush(); 
			return $this->redirectToRoute('indications');			  
		}
		return $this->render('adherent/modifierAdherent.html.twig',[
			'form'=>$form->createView(),]);
	}
	
	
}
