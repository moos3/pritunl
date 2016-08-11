apt_repository 'pritunl' do
  uri          'http://repo.pritunl.com/stable/apt'
  distribution node['lsb']['codename']
  components   ['main']
  keyserver    'keyserver.ubuntu.com'
  key          'CF8E292A'
end
