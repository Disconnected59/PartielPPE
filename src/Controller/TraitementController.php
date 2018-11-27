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
}
