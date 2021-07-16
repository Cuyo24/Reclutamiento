package com.b1soft;

//import com.b1soft.service.VacanteService;
import com.b1soft.service.pruebasPostulanteService;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class pruebasPostulanteController {
    
    @Autowired
    private pruebasPostulanteService pruebasPostulanteService;    
    
    
    @RequestMapping(value = "readVacante1.htm", method = RequestMethod.GET)
    public String readVacante(HttpServletRequest request) {
        return pruebasPostulanteService.readVacantes(request); 
    }
}
