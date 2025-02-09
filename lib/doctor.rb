require 'pry'

class Doctor
    attr_accessor :name
    @@all = []
    
    def initialize(name)
        @name = name
        save
    end

    def save
        self.class.all << self
    end

    def self.all
        @@all
    end

    def appointments
        Appointment.all.select { |appointment| appointment.doctor == self }
    end

    def new_appointment(date, patient)
        Appointment.new(date, patient, self)
    end

    def patients
        appointments.map do |appointment|  
            # binding.pry 
            appointment.patient 
        end
    end
end