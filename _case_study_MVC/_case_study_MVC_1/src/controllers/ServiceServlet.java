package controllers;

import common.Lib;
import models.service.RentTypeModel;
import models.service.ServiceModel;
import models.service.ServiceTypeModel;
import services.resortService.RentTypeService;
import services.resortService.ServiceRepository;
import services.resortService.ServiceTypeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServiceServlet", urlPatterns = "/service")
public class ServiceServlet extends HttpServlet {
    ServiceRepository serviceRepository = new ServiceRepository();
    RentTypeService rentTypeService = new RentTypeService();
    ServiceTypeService serviceTypeService = new ServiceTypeService();




    //__+__+__+__+__+__+__+__+__+__+__+__+__
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        System.out.println("+__+__+__+__+ " + action);
        switch (action) {
            case "create":
                saveService(request, response);
                break;
//            case "update":
//                updateCustomer(request, response);
//                break;
            default:
                getPageListService(request, response);
                break;

        }

    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        System.out.println("+__+__+__+__+ " + action);
        switch (action) {
            case "create":
                getPageCreateService(request, response);
                break;
//            case "update":
//                getPageUpdateCustomer(request, response);
//                break;
//            case "remove":
//                removeCustomer(request, response);
//                break;
            default:
                getPageListService(request, response);
                break;
        }

    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    private void saveService(HttpServletRequest request, HttpServletResponse response) {
        ServiceModel serviceModel = new ServiceModel();

        serviceModel.setServiceId(Integer.parseInt(request.getParameter("service_id")));
        serviceModel.setServiceName(request.getParameter("service_name"));
        serviceModel.setServiceArea(Integer.parseInt(request.getParameter("service_area")));
        serviceModel.setServiceCost(Double.parseDouble(request.getParameter("service_cost")));
        serviceModel.setServiceMaxPeople(Integer.parseInt(request.getParameter("service_max_people")));

        serviceModel.setRentTypeId(Integer.parseInt(request.getParameter("rent_type_id")));
        serviceModel.setServiceTypeId(Integer.parseInt(request.getParameter("service_type_id")));
        serviceModel.setStandardRoom(request.getParameter("standard_room"));
        serviceModel.setOtherConvenient(request.getParameter("description_other_convenient"));
        serviceModel.setPoolArea(Double.parseDouble(request.getParameter("pool_area")));

        serviceModel.setNumberOfFloor(Integer.parseInt(request.getParameter("number_of_floors")));

        serviceRepository.insertNew(serviceModel);
        Lib.responseSenDirect(response,"/service");
    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    private void getPageCreateService(HttpServletRequest request, HttpServletResponse response) {
        List<RentTypeModel> rentTypeModelList = rentTypeService.selectAllRentType();
        request.setAttribute("rentTypeModelList", rentTypeModelList);

        List<ServiceTypeModel> serviceTypeModelList = serviceTypeService.selectAllServiceType();
        request.setAttribute("serviceTypeModelList", serviceTypeModelList);

        List<ServiceModel> serviceModelList = serviceRepository.getAll();
        request.setAttribute("serviceModelList", serviceModelList);

        Lib.forwardToJSP(request, response, "view/service/createService.jsp");

    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    private void getPageListService(HttpServletRequest request, HttpServletResponse response) {
        List<ServiceModel> serviceModelList = serviceRepository.getAll();
        request.setAttribute("serviceModelList",serviceModelList);

        Lib.forwardToJSP(request, response,"view/service/listService.jsp");

    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__



//__+__+__+__+__+__+__+__+__+__+__+__+__
//__+__+__+__+__+__+__+__+__+__+__+__+__
}
