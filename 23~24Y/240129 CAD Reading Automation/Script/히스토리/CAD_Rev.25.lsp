;; 각 영역을 모두 확보했는데 출력이 안되고 있음
;; 내가 원하는 경로에 pdf 가 저장이 안됨
;; https://m.blog.naver.com/iagapeu/221322734578
;; 이거 보고 다시 하세요... 될 듯 한데 잘 안됨

(defun C:ExportAreaPDF ()
(setq coords '(

;; ;; 1행 1열 (-10133 158) 여백 35 도면 8
;; (-4036 158 -3200 740)
;; (-4907 158 -4071 740)
;; (-5778 158 -4942 740)
;; (-6649 158 -5813 740)
;; (-7520 158 -6684 740)
;; (-8391 158 -7555 740)
;; (-9262 158 -8426 740)
;; (-10133 158 -9297 740)

;; ;; 2행 1열 (-10133 -450) 여백 35 도면 8
;; (-4036 -450 -3200 132)
;; (-4907 -450 -4071 132)
;; (-5778 -450 -4942 132)
;; (-6649 -450 -5813 132)
;; (-7520 -450 -6684 132)
;; (-8391 -450 -7555 132)
;; (-9262 -450 -8426 132)
;; (-10133 -450 -9297 132)

;; ;; 3행 1열 (-10133 -1096) 여백 35 도면 8
;; (-4036 -1096 -3200 -514)
;; (-4907 -1096 -4071 -514)
;; (-5778 -1096 -4942 -514)
;; (-6649 -1096 -5813 -514)
;; (-7520 -1096 -6684 -514)
;; (-8391 -1096 -7555 -514)
;; (-9262 -1096 -8426 -514)
;; (-10133 -1096 -9297 -514)

;; ;; 4행 1열 (-10133 -1740) 여백 36 도면 9
;; (-3157 -1740 -2321 -1158)
;; (-4029 -1740 -3193 -1158)
;; (-4901 -1740 -4065 -1158)
;; (-5773 -1740 -4937 -1158)
;; (-6645 -1740 -5809 -1158)
;; (-7517 -1740 -6681 -1158)
;; (-8389 -1740 -7553 -1158)
;; (-9261 -1740 -8425 -1158)
;; (-10133 -1740 -9297 -1158)

;; ;; 5행 1열 (-9269 -2388) 여백 36 도면 7
;; (-4037 -2388 -3201 -1806)
;; (-4909 -2388 -4073 -1806)
;; (-5781 -2388 -4945 -1806)
;; (-6653 -2388 -5817 -1806)
;; (-7525 -2388 -6689 -1806)
;; (-8397 -2388 -7561 -1806)
;; (-9269 -2388 -8433 -1806)

;; ;; 6행 1열 (-9269 -3045) 여백 36 도면 8
;; (-3165 -3045 -2329 -2463)
;; (-4037 -3045 -3201 -2463)
;; (-4909 -3045 -4073 -2463)
;; (-5781 -3045 -4945 -2463)
;; (-6653 -3045 -5817 -2463)
;; (-7525 -3045 -6689 -2463)
;; (-8397 -3045 -7561 -2463)
;; (-9269 -3045 -8433 -2463)

;; ;; 7행 1열 (-10087 -3820) 여백 66 도면 1
;; (-10087 -3820 -9251 -3238)

;; ;; 7행 2열 (-9220 -3820) 여백 64 도면 5
;; (-5620 -3820 -4784 -3238)
;; (-6520 -3820 -5684 -3238)
;; (-7420 -3820 -6584 -3238)
;; (-8320 -3820 -7484 -3238)
;; (-9220 -3820 -8384 -3238)

;; ;; 8행 1열 (-10087 -4455) 여백 66 도면 1
;; (-10087 -4455 -9251 -3873)

;; ;; 8행 2열 (-9220 -4455) 여백 64 도면 4
;; (-6520 -4455 -5684 -3873)
;; (-7420 -4455 -6584 -3873)
;; (-8320 -4455 -7484 -3873)
;; (-9220 -4455 -8384 -3873)

;; ;; 9행 1열 (-9220 -5080) 여백 64 도면 2
;; (-8320 -5080 -7484 -4498)
;; (-9220 -5080 -8384 -4498)

;; ;; 10행 1열 (-9220 -5720) 여백 64 도면 5
;; (-5620 -5720 -4784 -5138)
;; (-6520 -5720 -5684 -5138)
(-7420 -5720 -6584 -5138)
(-8320 -5720 -7484 -5138)
(-9220 -5720 -8384 -5138)
))
​
;; 출력 경로
;; (setq outputPath "C:\\Users\\LG\\Downloads\\")
(setq outputPath "C:\\Users\\LG\\Desktop\\")
;; (setq outputPath "D:\\#.Secure Work Folder\\BIG\\Project\\00Temp\\")
;; (setq outputPath "D:\\#.Secure Work Folder\\BIG\\Project\\23~24Y\\240129 CAD Reading Automation\\PDF\\out\\") ; 출력 경로 설정
(setq i 0)
​
(foreach area coords
  (setq xMin (car area)
        yMin (cadr area)
        xMax (caddr area)
        yMax (cadddr area))
​
  ;; (command "-PLOT" "Y" "Model" "" "DWG To PDF.pc3" "" "Inches" "Landscape" "N" "Window"
  ;; (command "-PLOT" "Y" "Model" "" "AutoCAD PDF (General Documentation).pc3" "" "Inches" "Landscape" "N" "Window"
  ;; (command "-PLOT" "N" "Model" "" "ALPDF" "" "Inches" "Landscape" "N" "Window"
  ;; (command "-PLOT" "N" "Model" "" "DWG To PDF.pc3" "" "Inches" "Landscape" "N" "Window"
  ;;          (strcat (rtos xMin 2 2) "," (rtos yMin 2 2))
  ;;          (strcat (rtos xMax 2 2) "," (rtos yMax 2 2))
  ;;          "Fit" "Center" "Y" "" "Y" "N" "N" "N" "Y"
  ;;          (strcat outputPath "Output_" (itoa (1+ (setq i (1+ i)))) ".pdf")
  ;;          "Y")

  ;; (command "-PLOT" "N" "Model" "DWG To PDF.pc3" "Inches" "Landscape" "N" "Window"
  ;;         (strcat (rtos xMin 2 2) "," (rtos yMin 2 2))
  ;;         (strcat (rtos xMax 2 2) "," (rtos yMax 2 2))
  ;;         "Fit" "Center" "Y" "" "Y" "N" "N" "Y" "Y"
  ;;         (strcat outputPath "Output_" (itoa (1+ (setq i (1+ i)))) ".pdf")
  ;;         "Y")

  ;; (command "-PLOT" "Y" "Model" "" "DWG To PDF.pc3" "" "Inches" "Landscape" "N" "Window"
  ;; (command "-PLOT" "N" "Model" "" "DWG To PDF.pc3" "" "Inches" "Landscape" "Y" "Window" ;; 기본
  (command "-PLOT" "N" "Model" "Adobe PDF" "" "Inches" "Landscape" "N" "Window"  
      ;; 순차적으로 출력은 되는데 저장은 안됨
  ;; (command "-PLOT" "N" "Model" "Adobe PDF" "" "Inches" "Landscape" "Y" "Window"  
      ;; 순차적 진행, 저장 안됨
  ;; (command "-PLOT" "N" "Model" "ALPDF" "" "Inches" "Landscape" "Y" "Window"  
      ;; 순차적 진행, 저장 안됨
  ;; (command "-PLOT" "N" "Model" "ALPDF" "Inches" "Landscape" "Y" "Window"  
      ;; 이상하게 됨
  ;; (command "-PLOT" "N" "Model" "" "DWG To PDF.pc3" "" "Inches" "Landscape" "Y" "Window" ;; 기본
      ;; 순차적 진행, 세로 출력, 저장 안됨
;;   (command "-PLOT" "N" "" "DWG To PDF.pc3" "" "Inches" "Landscape" "Y" "Window"  
      ;; 순차적 진행, 세로 출력, 저장 안됨
           (strcat (rtos xMin 2 2) "," (rtos yMin 2 2))
           (strcat (rtos xMax 2 2) "," (rtos yMax 2 2))
           "Fit" "Center" "Y" "" "Y" "N" "N" "N" "Y"
           (strcat outputPath "Output_" (itoa (1+ (setq i (1+ i)))) ".pdf")
           "Y")

  (command "_.delay" "2000") ; pause 추가
)
(princ)
)