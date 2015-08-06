class Option < ActiveRecord::Base
  belongs_to :building

  # return all associated option_lights lines
  def lights
    OptionLight.all.where(option:self)
  end

  # return associated building
  def building
    Building.find(self.building_id)
  end

  def installation
    self.summary[:installation]
  end

  def watts
    self.summary[:watts]
  end

  def pa
    self.summary[:pa]
  end

  # returns hash with details of lightbulbs in option
  def summary
    # get all option lights for self
    option_lights = OptionLight.all.where(option:self)

    # initialise results hash
    option_summary = {}
    option_summary[:tally] = {}
    option_summary[:installation] = 0
    option_summary[:watts] = 0

    # iterate over each option light
    for option_light in option_lights
      light = Light.find(option_light.light_id)

      # check if light has already got entries in tally
      if !option_summary[:tally].keys.include?light.id
        # initialise tally at 0 if light has no entries
        option_summary[:tally][light.id] = 0
      end
      # increment tally for light
      option_summary[:tally][light.id] += 1
      # add wattage to total
      option_summary[:watts] += light.watts
      # add price to installation total
      option_summary[:installation] += light.price
    end

    option_summary[:pa] = option_summary[:watts] * 24 * 7 * 52 * 0.30 / 1000

    option_summary
  end
end
