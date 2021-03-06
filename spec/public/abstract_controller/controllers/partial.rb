

module Merb::Test::Fixtures

  module Abstract

    class RenderIt < Merb::AbstractController
      self._template_root = File.dirname(__FILE__) / "views"

      def _template_location(action, type = nil, controller = controller_name)
        "partial/#{File.basename(controller)}/#{action}"
      end
    end

    class BasicPartial < RenderIt

      def index
        render
      end
    end

    class WithPartial < RenderIt

      def index
        @foo = "With"
        render
      end
    end

    class WithNilPartial < RenderIt

      def index
        render
      end
    end

    class WithAsPartial < RenderIt

      def index
        @foo = "With and As"
        render
      end
    end

    class PartialWithCollections < RenderIt

      def index
        @foo = %w{ c o l l e c t i o n }
        render
      end
    end

    class PartialWithCollectionsAndAs < RenderIt

      def index
        @foo = %w{ c o l l e c t i o n }
        render
      end
    end

    class PartialWithLocals < RenderIt

      def index
        @foo, @bar = %w{ local variables }
        render
      end
    end

    class PartialWithBoth < RenderIt

      def index
        @foo = %w{ c o l l e c t i o n }
        @delimiter = "-"
        render
      end
    end

    class PartialWithWithAndLocals < RenderIt

      def index
        @foo, @bar = "with", "and locals"
        render
      end
    end

    class PartialInAnotherDirectory < RenderIt

      def index
        render
      end
    end

    class NestedPartial < RenderIt
      def index
        render
      end
    end

    class BasicPartialWithMultipleRoots < RenderIt
      self._template_roots << [File.dirname(__FILE__) / "alt_views", :_template_location]
      def index
        render
      end
    end
  end
end
