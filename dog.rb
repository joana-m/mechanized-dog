# rubocop:disable Style/Documentation

class Dog
  attr_accessor :position_x, :position_y, :facing

  FACING = %w[west north east south].freeze

  def drop!(position_x, position_y, facing)
    if in_park?(position_x) && in_park?(position_y) && FACING.include?(facing)
      @position_x = position_x
      @position_y = position_y
      @facing = facing
    else
      puts 'The dog is not in the park. Drop again to move within the park.'
    end
  end

  def walk!
    message = 'The dog cannot leave the park.'
    case @facing
    when 'south'
      in_park?(@position_y - 1) ? @position_y -= 1 : puts(message)
    when 'north'
      in_park?(@position_y + 1) ? @position_y += 1 : puts(message)
    when 'east'
      in_park?(@position_x + 1) ? @position_x += 1 : puts(message)
    when 'west'
      in_park?(@position_x - 1) ? @position_x -= 1 : puts(message)
    end
  end

  def turn!(direction)
    case direction
    when 'left'
      @facing = FACING[FACING.index(@facing) - 1]
    when 'right'
      @facing = FACING[FACING.index(@facing) - 3]
    end
  end

  def bark
    if in_park?(@position_x) && in_park?(@position_y)
      puts "The dog is position: #{@position_x}, #{@position_y}, #{@facing}"
    else
      puts 'The dog is no longer in the park. Drop to put it back in.'
    end
  end

  private

  def in_park?(position)
    true if position >= 0 && position <= 5
  end
end
