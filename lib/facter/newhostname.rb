require 'facter/util/caching'

Facter.add(:chostname) do
  confine :kernel => 'windows'
  setcode do
        Facter::Core::Execution.exec('hostname')
  end
end


Facter.add(:ccachehostname) do
  cache_for 10, :minutes
  confine :kernel => 'Linux'
  cache(:customcachehostname) do
        Facter::Core::Execution.exec('hostname')
  end
end