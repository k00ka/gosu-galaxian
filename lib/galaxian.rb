require 'rubygems'
require 'gosu'

require_relative 'alien_squadron'
require_relative 'bullet'
require_relative 'ship'

class Galaxian < Gosu::Window
  attr_reader :images, :audio, :delta, :aliens, :bullets, :ship, :squads
  attr_accessor :score

  IMAGE_ASSETS = {
    :background => 'background.png',
    :ship => 'captain.png',
    :alien => 'alien.png',
    :bullet => 'laser.png'
  }

  AUDIO_ASSETS = {
    :shoot => 'shoot.wav',
    :kill => 'kill.wav'
  }

  def initialize
    super(550, 600)
    self.caption = 'Shooter'
    @images = {}
    @audio = {}

    @ship = nil
    @bullets = []
    @aliens = []
    @squads = []
  end

  def show
    self.load_assets
    self.setup_game
    super
  end

  def draw
    # draw background
    @images[:background].draw(0, 0, 0)

    # draw the sprites
    @ship.draw
    @bullets.each {|bullet| bullet.draw }
    @aliens.each {|alien| alien.draw }

    # draw the score
    @font.draw("#{@score}", 10, 10, 20)
  end

  def update
    self.update_delta
    self.spawn_enemies
    self.release_alien

    @ship.update
    @bullets.each {|bullet| bullet.update }
    @aliens.each {|alien| alien.update }

    self.handle_kills
  end

  def release_alien
    @aliens.each do |alien|
      if rand(500) == 0
        alien.released = true
      end
    end
  end

  def button_up(key)
    self.close if key == Gosu::KbEscape
    self.shoot if key == Gosu::KbSpace
  end

  protected

  def load_assets
    IMAGE_ASSETS.each do |key, value|
      @images[key] = Gosu::Image.new(self, "gfx/#{value}")
    end

    AUDIO_ASSETS.each do |key, value|
      @audio[key] = Gosu::Sample.new(self, "sfx/#{value}")
    end

    @font = Gosu::Font.new(self, 'Courier', 40)
  end

  def update_delta
    current_time = Gosu::milliseconds / 1000.0
    @delta = [current_time - @last_time, 0.25].min
    @last_time = current_time
  end

  def setup_game
    @last_time = Gosu::milliseconds / 1000.0
    @ship = Ship.new
    @score = 0
  end

  def shoot
    @bullets.push(Bullet.new(@ship.x, @ship.y)) unless @ship.nil?
    @audio[:shoot].play
  end

  #CLEAN ME SEYMORE
  def spawn_enemies
    # to reduce squad frequency we changed the if from 400 * delta to 80 * delta
    if @squads == []
      squad = AlienSquadron.new
      @squads.push(squad)
      squad.get_aliens.each do |alien|
        @aliens.push(alien)
      end
    end
  end

  def handle_kills
    @aliens.reject! {|x| x.killed? }
    @squads.reject! {|x| x.killed? }
    @bullets.reject! {|x| x.killed? }
    self.game_over if @ship.killed?
  end

  def game_over
    self.close
  end

  public

  def score
    @score
  end
end
