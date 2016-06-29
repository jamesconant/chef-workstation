describe command 'apt-config dump' do
  it "confirms `dpkg` is configured to keep old configs without prompt during install" do
    expect(subject.stdout).to include('Dpkg::Options:: "--force-confold";')
    expect(subject.stdout).to include('Dpkg::Options:: "--force-confold";')
  end
end
