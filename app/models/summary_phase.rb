class SummaryPhase < ApplicationRecord
  belongs_to :summary
  has_many :documents

  INSTALLATION 	= 1
  INVESTIGATION = 2
  ACCUSATORY 	= 3
  INFORMATIVE 	= 4
  RESOLVE 		= 5
  CLAIM 		= 6

  PHASES = {
  	INSTALLATION => "Instalación de Fiscalia", 
  	INVESTIGATION => "Etapa Indagatoria",
  	ACCUSATORY => "Etapa Acusatoria",
  	INFORMATIVE => "Etapa Informativa al Jefe Superior",
  	RESOLVE => "Etapa Resolutiva",
  	CLAIM => "Etapa de Reclamación"

  }



end
