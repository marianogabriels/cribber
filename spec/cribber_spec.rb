require "spec_helper"

RSpec.describe Cribber do
  it "has a version number" do
    expect(Cribber::VERSION).not_to be nil
  end

  it "does something useful" do
    message_1 = "mensaje de prueba"
    message_2 = "hola mundo otro mensaje"
    key = Cribber.random_key(10)
    e_message_1 = Cribber.strxor(message_1,key)
    e_message_2 = Cribber.strxor(message_2,key)
    same_key_encrypted_messages = Cribber.strxor(e_message_1,e_message_2)
    puts Cribber.crib(same_key_encrypted_messages,"hola mundo")[0].inspect
  end
end
