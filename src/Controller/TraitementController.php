<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\Date;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use App\Form\TraitementType;
use App\Entity\Traitement;

class TraitementController extends AbstractController
{
    /**
     * @Route("/traitement", name="traitement")
     */
    public function index()
    {
    	/*$unAdherent = new Traitement();
    	$unAdherent -> setDateDebut(new \DateTime());
    	$unAdherent -> setDuree(0);
    	$unAdherent -> setNomPatient("gertrude");
    	$em = $this -> getDoctrine() -> getManager();
    	$em -> persist($unAdherent);
    	$em -> flush();*/
    	$repository = $this -> getDoctrine() -> getRepository(Traitement::class);
    	$lesTraitement = $repository -> findAll();
        return $this->render('traitement/index.html.twig', [
            'traitements' => $lesTraitement,
        ]);
    }
    /**
     * @Route("/traitement/ajouter", name="ajouterTraitement")
     */
    public function ajouter(Request $request)
    {
    	$em = $this -> getDoctrine() -> getManager();
    	$traitement = new Traitement();
    	$form = $this -> createForm(TraitementType::class,$traitement);
    	$form -> handleRequest($request);
    	if ($form -> isSubmitted() && $form -> isValid()) {
    		$traitement = $form -> getData();
    		$em = $this -> getDoctrine() -> getManager();
    		$em -> persist($traitement);
    		$em -> flush();
    		return $this -> redirectToRoute('traitement');
    	}
    	return $this->render('traitement/ajouter.html.twig', [
            'form' => $form -> createView(),
        ]);;
    }
    /**
     * @Route("/traitement/modifier/{id}", name="modifierTraitement")
     */
    public function modifier($id, Request $request)
    {
    	$repository = $this -> getDoctrine() -> getRepository(Traitement::class);
    	$traitement = $repository -> find($id);
    	$form = $this -> createForm(TraitementType::class, $traitement);
    	$form -> handleRequest($request);
    	if ($form -> isSubmitted() && $form -> isValid()) {
    		$traitement = $form -> getData();
    		$em = $this -> getDoctrine() -> getManager();
    		$em -> persist($traitement);
    		$em -> flush();
    		return $this -> redirectToRoute('traitement');
    	}
    	return $this -> render('traitement/modifier.html.twig', [
    		'form' => $form -> createView(),
    	]);
    }
    /**
     * @Route("/traitement/supprimer/{id}", name="supprimerTraitement")
     */
    public function supprimer($id, Request $request)
    {
    	$repository = $this -> getDoctrine() -> getRepository(Traitement::class);
    	$traitement = $repository -> find($id);
    	$em = $this -> getDoctrine() -> getManager();
    	$em -> remove($traitement);
    	$em -> flush();
    	return $this -> redirectToRoute('traitement');
    }

}
