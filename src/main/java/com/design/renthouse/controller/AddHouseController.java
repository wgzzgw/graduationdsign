package com.design.renthouse.controller;

import com.design.renthouse.entity.House;
import com.design.renthouse.service.IHouserService;
import com.design.renthouse.util.FileUtil;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("addHouse")
public class AddHouseController {
    // 简介图片地址
    private String simplePath = "";
    // 详细图片地址
    private StringBuilder detailsPath = new StringBuilder();
    @Autowired
    private IHouserService service;
    /**
     * 上传文件
     * @param request
     * @param response
     * @param file 上传的文件，支持多文件
     * @throws Exception
     */
    @RequestMapping("insert")
    public void insert(HttpServletRequest request, HttpServletResponse response
            , @RequestParam("file") MultipartFile[] file) throws Exception{
        if(file!=null&&file.length>0){
            //组合image名称，“;隔开”
            List<String> fileName =new ArrayList<String>();
            try {
                String tmpsrc="";
                for (int i = 0; i < file.length; i++) {
                    if (!file[i].isEmpty()) {
                        //上传文件，随机名称，";"分号隔开
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                        tmpsrc=FileUtil.uploadImage(request, "/upload/"+sdf.format(new Date())+"/", file[i], true);
                        fileName.add(tmpsrc);
                    }
                }

                //上传成功
                if(fileName!=null&&fileName.size()>0){
                    System.out.println("上传成功！");
                        simplePath=tmpsrc;
                }else {
                    System.out.println("上传失败！文件格式错误！");
                }
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("上传出现异常！异常出现在：class.UploadController.insert()");
            }
        }else {
            System.out.println("没有检测到文件！");
        }
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("result", "ok");
        response.getWriter().write(jsonObject.toString());
    }
    /**
     * 上传文件
     * @param request
     * @param response
     * @param file 上传的文件，支持多文件
     * @throws Exception
     */
    @RequestMapping("insert2")
    public void insert2(HttpServletRequest request, HttpServletResponse response
            , @RequestParam("file") MultipartFile[] file) throws Exception{
        if(file!=null&&file.length>0){
            //组合image名称，“;隔开”
            List<String> fileName =new ArrayList<String>();
            try {
                String tmpsrc="";
                for (int i = 0; i < file.length; i++) {
                    if (!file[i].isEmpty()) {
                        //上传文件，随机名称，";"分号隔开
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                        tmpsrc=FileUtil.uploadImage(request, "/upload/"+sdf.format(new Date())+"/", file[i], true);
                        fileName.add(tmpsrc);
                    }
                }

                //上传成功
                if(fileName!=null&&fileName.size()>0){
                    System.out.println("上传成功！");
                    detailsPath.append(tmpsrc+"~");
                }else {
                    System.out.println("上传失败！文件格式错误！");
                }
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("上传出现异常！异常出现在：class.UploadController.insert()");
            }
        }else {
            System.out.println("没有检测到文件！");
        }
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("result", "ok");
        response.getWriter().write(jsonObject.toString());
    }
    @RequestMapping("addHouseRecord")
    @ResponseBody
    public String addHouse(@RequestBody House house) {
        System.out.println("addhouse");
        if(house.getPublisher()==null||"".equals(house.getPublisher())) {
            house.setPublisher("管理员");
        }
        house.setHouseImage(simplePath);
        house.setHouseDetailsImg(detailsPath.toString());
        int n = service.addNewHouse(house);
        if(n>0) {
            detailsPath.delete(0,detailsPath.length());
            return "OK";
        }
        return "FAIL";
    }
}
