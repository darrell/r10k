require 'r10k'

class R10K::Root

  # @!attribute [r] source
  #   The location of the remote git repository
  attr_reader :source

  # @!attribute [r] path
  #   The destination path of the root
  attr_reader :path

  # @!attribute [r] branch
  #   The git branch to instantiate into the path
  attr_reader :branch

  attr_reader :modules

  def initialize(source, path, branch)
    @source, @path, @branch = source, path, branch
  end

  def sync!
    synchro = R10K::Synchro::Git.new(@source)
    synchro.sync(@path, @branch)
  end

  def modules
    librarian = R10K::Librarian.new("#{path}/Puppetfile")
    @modules  = librarian.load
  end
end

require 'r10k/synchro/git'
