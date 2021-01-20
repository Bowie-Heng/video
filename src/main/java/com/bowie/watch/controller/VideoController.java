package com.bowie.watch.controller;

import cn.hutool.core.io.FileUtil;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.PostConstruct;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/video")
public class VideoController {

    private volatile List<String> urls = Collections.synchronizedList(new ArrayList<String>());


    @RequestMapping("/index")
    public String index(ModelMap model) {
        Random random = new Random();
        int line = random.nextInt(urls.size());
        model.put("indexUrl", urls.get(line - 1));
        return "video";
    }

    @ResponseBody
    @RequestMapping("/change")
    public String change() {
        Random random = new Random();
        int line = random.nextInt(urls.size());
        return urls.get(line - 1);
    }

    @PostConstruct
    public void init() {
        try {
            urls = FileUtil.loadUtf8(new ClassPathResource("static/url/url.txt").getFile(), bufferedReader -> bufferedReader.lines().collect(Collectors.toList()));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
