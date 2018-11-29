<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Medicament;
use App\Form\MedicamentType;
use Symfony\Component\HttpFoundation\Request;

class MedicamentController extends AbstractController
{
    /**
     * @Route("/medicament", name="medicament")
     */
    public function index()
    {
        $repository=$this->getDoctrine()->getRepository(Medicament::class);
		$lesMedocs=$repository->findAll();
		return $this->render('medicament/index.html.twig',[
			'medicament'=>$lesMedocs,
		]);
    }
	
	/**
	* @Route("/medicament/creer", name="creer")
	*/
	public function creerMedicament(Request $request)
	{
		$repository=$this->getDoctrine()->getRepository(Medicament::class);
		$em=$this->getDoctrine()->getManager();
		$medicament=new Medicament();
		$form= $this->createForm(MedicamentType::class, $medicament);
				   $form->handleRequest($request);
					if($form->isSubmitted() && $form->isValid()) {
						$medicament = $form->getData();
						$em=$this->getDoctrine()->getManager();
						$em->persist($medicament);
						$em->flush(); 
			return $this->redirectToRoute('medicament');
		}
						return $this->render('medicament/formMedicament.html.twig',[
		'form'=>$form->createView(),]);
	
	}
}
