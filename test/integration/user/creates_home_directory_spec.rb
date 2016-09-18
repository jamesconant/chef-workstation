directories = [
  '.kdb',
  '.ssh',
  'bin',
  'doc',
  'dls',
  'prj',
  'tmp'
]

directories.each do |dir|
  full_dir = "/home/jconant/#{dir}"

  describe file full_dir do
    it { should exist }
    it { should be_directory }
  end
end
