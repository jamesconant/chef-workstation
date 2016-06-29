describe command 'nvidia-settings -v' do
  it "confirms nvidia proprietary module is installed" do
    expect(subject.stdout).to include('NVIDIA')
  end
end
