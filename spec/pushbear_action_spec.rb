describe Fastlane::Actions::PushbearAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The pushbear plugin is working!")

      Fastlane::Actions::PushbearAction.run(nil)
    end
  end
end
