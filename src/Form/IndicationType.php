<?php 
namespace App\Form;
use App\Entity\Indication;
use App\Entity\Traitement;
use App\Entity\Medicament;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;

class AdherentType extends AbstractType
{
	public function buildForm(FormBuilderInterface $builder, array $options)
	{
		$builder
			->add('id')
			->add('traitementId',EntityType::class,array('class'=>Traitement::class,'choice_label'=>'nom_patient'))
			->add('medicamentId',EntityType::class,array('class'=>Medicament::class,'choice_label'=>'libelle'))
			->add('posologie',TextType::class)
			->getForm();
			
	
	}
	
	public function configureOptions(OptionsResolver $resolver)
	{
		$resolver->setDefaults(array('data_class'=>Indication::class));
	}



}


?>