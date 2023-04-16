require 'diary'

class SecretDiary
  def initialize(diary) # diary is an instance of Diary
    @unlocked = false
    @diary = diary
  end

  def read
    # Raises the error "Go away!" if the diary is locked
    # Returns the diary's contents if the diary is unlocked
    # The diary starts off locked
    @unlocked == true ? @diary.read : 'Go away!'
  end

  def lock
    # Locks the diary
    # Returns nothing
    @unlocked = false
  end

  def unlock
    # Unlocks the diary
    # Returns nothing
    @unlocked = true
  end
end