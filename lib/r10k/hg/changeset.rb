require 'r10k/hg/rev'
require 'r10k/hg/repository'

# A changeset is an atomic collection of changes to files in a repository.
#
# @see http://mercurial.selenic.com/wiki/ChangeSet
# @api private
class R10K::HG::Changeset < R10K::HG::Rev

  # @!attribute [r] changeset
  #   @return [String] The hg changeset
  attr_reader :changeset
  alias :rev :changeset

  def initialize(changeset, repository = nil)
    @changeset = changeset
    @repository = repository
  end

  def fetch?
    ! resolvable?
  end
end
