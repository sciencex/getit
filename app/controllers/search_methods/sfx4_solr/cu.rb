module SearchMethods
  module Sfx4Solr
    module Cu
      def az_title_klass
        Module.const_get(:Sfx4).const_get(:Cu).const_get(:AzTitle)
      end
      include SearchMethods::Sfx4Solr::Searcher
    end
  end
end