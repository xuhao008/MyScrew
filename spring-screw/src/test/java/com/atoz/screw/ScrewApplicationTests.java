package com.atoz.screw;

import cn.smallbun.screw.core.Configuration;
import cn.smallbun.screw.core.engine.EngineConfig;
import cn.smallbun.screw.core.engine.EngineFileType;
import cn.smallbun.screw.core.engine.EngineTemplateType;
import cn.smallbun.screw.core.execute.DocumentationExecute;
import cn.smallbun.screw.core.process.ProcessConfig;
import io.github.yedaxia.apidocs.Docs;
import io.github.yedaxia.apidocs.DocsConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.ApplicationContext;

import javax.sql.DataSource;
import java.io.*;
import java.util.ArrayList;

@SpringBootTest
class ScrewApplicationTests {

    @Autowired
    ApplicationContext applicationContext;

    /**
     * @return void
     * @Description 生成数据库文档，screw 有 HTML、DOC、MD 三种格式的文档。
     * @Param []
     * @Date 2020/8/13 11:00
     **/
    @Test
    void contextLoads() {
        DataSource dataSourceMysql = applicationContext.getBean(DataSource.class);
        // 生成文件配置
        EngineConfig engineConfig = EngineConfig.builder()
                // 生成文件路径，自己mac本地的地址，这里需要自己更换下路径
                //.fileOutputDir("D:/")
                // 打开目录
                .openOutputDir(false)
                // 文件类型，screw 有 HTML、WORD、MD 三种格式的文档。
                //.fileType(EngineFileType.HTML)
                .fileType(EngineFileType.MD)
                // 生成模板实现
                .produceType(EngineTemplateType.freemarker).build();
                // 生成文档配置（包含以下自定义版本号、描述等配置连接）
                Configuration config = Configuration.builder()
                .version("1.0.2")
                .description("生成文档信息描述")
                .dataSource(dataSourceMysql)
                .engineConfig(engineConfig)
                .produceConfig(getProcessConfig())
                .build();
        // 执行生成
        new DocumentationExecute(config).execute();
    }

    /**
     * 配置想要生成的表+ 配置想要忽略的表
     *
     * @return 生成表配置
     */
    public static ProcessConfig getProcessConfig() {
        // 忽略表名
       // List<String> ignoreTableName = Arrays.asList("aasasa", "test_gsasaroup");
        // 忽略表前缀，如忽略a开头的数据库表
       // List<String> ignorePrefix = Arrays.asList("ssasas", "tsasa");
        // 忽略表后缀
       // List<String> ignoreSuffix = Arrays.asList("_tesasat", "czsasb_");
        return ProcessConfig.builder()
                //根据名称指定表生成
                //.designatedTableName(Arrays.asList("fire_user"))
                //根据表前缀生成
                .designatedTablePrefix(new ArrayList<>())
                //根据表后缀生成
                .designatedTableSuffix(new ArrayList<>()).build();
                //忽略表名
                //.ignoreTableName(ignoreTableName)
                //忽略表前缀
               // .ignoreTablePrefix(ignorePrefix)
                //忽略表后缀
                //.ignoreTableSuffix(ignoreSuffix).build();
    }

    /**
     * @Description  JApiDocs生成接口文档
     * @Param []
     * @return void
     * @Date 2020/8/13 15:00
     **/
    @Test
    void Api(){
        DocsConfig config = new DocsConfig();
        config.setProjectPath("E:\\个人文件\\project\\screw\\src\\main\\java\\com\\atoz\\screw"); // 项目根目录
        config.setProjectName("screw"); // 项目名称
        config.setApiVersion("V1.0");       // 声明该API的版本
        config.setDocsPath("E:\\个人文件\\project\\screw\\doc"); // 生成API 文档所在目录
        config.setAutoGenerate(Boolean.TRUE);  // 配置自动生成
        Docs.buildHtmlDocs(config); // 执行生成文档
    }

    //需求: 爬取起点中文网中某一部小说的全部(免费的章节)内容
    public static void main(String[] args) throws IOException {

        //1. 确定首页URL: 重生柯南当侦探小说的第一章的URL
        String indexUrl = "https://read.qidian.com/chapter/nKVO7k6YUptmzDX0o03xsg2/6Ko8rgNY4EBp4rPq4Fd4KQ2";
        //创建一个输出流,将爬到的小说以txt形式保存在硬盘
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream("E:\\个人文件\\md\\重生柯南当侦探.txt")));

        while (true) {
            //2. 发送请求, 获取数据
            //2.1 创建httpClient对象
            CloseableHttpClient httpClient = HttpClients.createDefault();

            //2.2 设置请求方式
            HttpGet httpGet = new HttpGet(indexUrl);
            //2.3 设置请求参数 和请求头
            httpGet.setHeader("User-Agent", "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.131 Safari/537.36");

            //2.4 发送请求, 获取响应
            CloseableHttpResponse response = httpClient.execute(httpGet);
            //2.5 获取数据

            String html = EntityUtils.toString(response.getEntity(), "UTF-8");
            //System.out.println(html);

            //3. 解析数据:
            Document document = Jsoup.parse(html);

            //获得本章的章节名称 并输出到文本中
            Elements chapterName = document.select(".j_chapterName");
            System.out.println(chapterName.text());
            bw.write(chapterName.text());
            bw.newLine();
            bw.flush();

            //获得本章的小说内容 并输出到文本中
            Elements pEl = document.select("[class=read-content j_readContent] p");
            for (Element p : pEl) {
                bw.write(p.text());
                System.out.println(p.text());
                bw.newLine();
                bw.flush();
            }

            //下一章内容:
            Elements aEl = document.select("#j_chapterNext[href*=chapter]");

            if (aEl == null || aEl.size() == 0) {
                break;
            }
            Object nextUrl = aEl.attr("href");
            indexUrl = "http:" + nextUrl;
            System.out.println(indexUrl);
            //4. 关闭httpClient对象
            httpClient.close();
        }
    }
}

