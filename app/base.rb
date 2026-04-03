
SCR_WIDTH = 1280
SCR_HEIGHT = 720


class Entity
    attr_sprite

    def initialize id, x, y, w, h, path
        @id = id

        if path.nil?
            @w = w.nil? ? 32 : w
            @h = h.nil? ? 32 : h
            @path = 'sprites/dummy.png'
        else
            @w = w
            @h = h
            @path = path
        end
    end

    def update scene, args
    end
end


class Scene
    attr :entities

    def initialize args
        @entities = []
    end

    def update_bg args
    end

    def update_fg args
        @entities.each do |i|
            i.update self, args
            args.outputs.sprites << i
        end
    end
    def update args
        update_bg args
        update_fg args
    end
end

class World
    def self.init scene, args
        args.state.scene ||= scene.new(args)
    end
    def self.update args
        args.state.scene.update args
    end
end
