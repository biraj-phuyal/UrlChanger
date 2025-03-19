# frozen string literal: true

class ApplicationService
    def self.perform(*args, &block)
        new(*args, &block).perform
    end
end
