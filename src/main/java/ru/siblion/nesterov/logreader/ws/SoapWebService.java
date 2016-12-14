package ru.siblion.nesterov.logreader.ws;

import ru.siblion.nesterov.logreader.type.LogMessage;

import javax.ejb.Stateless;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;

import java.util.Collections;
import java.util.List;

import static ru.siblion.nesterov.logreader.core.LogReader.getLogMessages;

/**
 * Created by alexander nesterov on 05.12.2016.
 */
@WebService(name = "SoapWebService")
@Stateless
public class SoapWebService {

    @WebMethod(operationName = "getListOfLogMessages")
    public List<LogMessage> getListOfLogMessages(@WebParam(name = "string") String string, @WebParam(name = "location") String location) {
        List<LogMessage> logMessageList = null;
        try {
            logMessageList = getLogMessages(string, location);
        } catch (Exception e) {
            e.printStackTrace();
        }
        Collections.sort(logMessageList);
        return logMessageList;
    }
}