class TennisSet
  def self.para_comenzar
    SetComun.new
  end

  def sumar_set_en un_puntaje
    raise 'Deberia implementarse en sus subclases'
  end
end

class SetComun < TennisSet
  def valor
    0
  end

  def sumar_set_en un_puntaje
    SetFinal.new
  end
end

class SetFinal < TennisSet
  def valor
    1
  end

  def sumar_set_en un_puntaje
    un_puntaje.se_termino_el_set_final
  end
end