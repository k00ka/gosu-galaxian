require_relative 'sprite'
require_relative 'alien'

class AlienSquadron
  # stub to be implemented by our partners
  def initialize
    @squad_aliens = []
    (1..10).each do |i|
      @squad_aliens << Alien.new(i*50)
    end
  end

  def get_aliens
    @squad_aliens
  end

  def killed?
    @squad_aliens.all? {|alien| alien.killed? }
  end
end
