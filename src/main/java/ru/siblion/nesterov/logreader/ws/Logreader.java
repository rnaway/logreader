package ru.siblion.nesterov.logreader.ws;

import ru.siblion.nesterov.logreader.type.LogMessage;
import ru.siblion.nesterov.logreader.util.Methods;

import javax.ejb.Stateless;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;

import java.util.Collections;
import java.util.List;

/**
 * Created by alexander nesterov on 05.12.2016.
 */
@WebService(name = "Logreader")
@Stateless
public class Logreader {

    @WebMethod(operationName = "getLogMessageList")
    public List<LogMessage> getLogMessageList(@WebParam(name = "string") String string, @WebParam(name = "location") String location) {
        List<LogMessage> logMessageList = Methods.getLogMessageList(string, location);
        Collections.sort(logMessageList);
        return logMessageList;
    }
}
