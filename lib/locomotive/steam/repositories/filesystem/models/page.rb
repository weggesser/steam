module Locomotive
  module Steam
    module Repositories
      module Filesystem
        module Models

          class Page < Base

            set_localized_attributes [:title, :slug, :permalink, :editable_elements, :template, :template_path, :fullpath, :seo_title, :meta_description, :meta_keywords]

            attr_accessor :depth, :_fullpath, :content_entry

            def initialize(attributes)
              super({
                handle:             nil,
                listed:             true,
                published:          false,
                fullpath:           {},
                content_type:       nil,
                position:           100,
                template:           {},
                editable_elements:  {}
              }.merge(attributes))
            end

            def listed?; !!listed; end
            def published?; !!published; end

            def templatized?
              !!content_type
            end

            def depth_and_position
              depth * 200 + position
            end

            def index?
              attributes[:fullpath].values.first == 'index'
            end

            def not_found?
              attributes[:fullpath].values.first == '404'
            end

            def to_liquid
              Steam::Liquid::Drops::Page.new(self)
            end

          end

        end
      end
    end
  end
end
