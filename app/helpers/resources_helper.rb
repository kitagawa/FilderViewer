module ResourcesHelper
  def get_filename(path)
    splits = path.split(/\//)
    splits[splits.length-1]
  end
end
