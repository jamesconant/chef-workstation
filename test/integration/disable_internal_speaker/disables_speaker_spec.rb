describe command 'modprobe -c | grep pcspkr' do
  it "confirms pcspkr module is blacklisted" do
    expect(subject.stdout).to include('blacklist pcspkr')
  end
end
