package com.mt.services;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Класс EmployeeService отвечает за обработку запросов, связанных с сотрудниками.
 */
@Controller
@RequestMapping("/employee")
public class EmployeeService {

    /**
     * Обрабатывает GET-запрос для получения деталей сотрудника.
     *
     * @param request  объект запроса, содержащий информацию о запросе
     * @param response объект ответа, используемый для формирования ответа
     * @param httpSession объект сессии, который может использоваться для хранения информации о сессии
     * @return строка в формате JSON с деталями сотрудника
     * @throws JSONException если возникает ошибка при создании JSON-объекта
     */
    @RequestMapping(value = "/getEmployeeDetails", method = RequestMethod.GET)
    @ResponseBody
    String uploadImage(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession)
            throws JSONException {

        // Создаем новый JSON-объект для хранения данных о сотруднике
        JSONObject js = new JSONObject();
        js.put("Name", "Mithun Technologies");
        js.put("Calling Name", "Mithun");
        js.put("DOB", "08-Nov-2011");
        js.put("Hobbies", "Reading Technical Blogs,Teaching, Helping to Poor People..");
        js.put("Places he like", "His native place");

        // Возвращаем строку JSON, содержащую информацию о сотруднике
        return js.toString();
    }
}