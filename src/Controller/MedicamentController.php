<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Medicament;

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
}
