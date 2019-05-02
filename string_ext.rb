module StringExt
  refine String do
    def integer?
      (self =~ /\A[1-9][0-9]*\z/) != nil
    end
  end
end
