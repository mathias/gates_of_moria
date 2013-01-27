class Door
  def self.read
    "fcrnx sevraq naq ragre"
  end

  def self.tell text
    if text == 'sevraq'
      "The door opens!"
    else
      "The door remains firmly shut."
    end
  end
end
