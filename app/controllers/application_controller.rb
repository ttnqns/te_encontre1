class ApplicationController < ActionController::Base
    #include Pagy::Backend
    def after_sign_in_path_for(resource)
        mascotas_path
    end

    def after_sign_out_path_for(resource_or_scope)
        mascotas_path # Ruta a la que se redirigirá después de cerrar sesión
    end


       
end
