describe command 'modprobe -c | grep nouveau' do
  it "confirms nouveau module is blacklisted" do
    expect(subject.stdout).to include('blacklist nouveau')
  end
end
