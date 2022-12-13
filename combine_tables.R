
# search table in the folder of df_table

df.list <- list.files(path = "./df_table/", pattern = "*.csv", all.files = FALSE,
                full.names = TRUE, recursive = FALSE,
                ignore.case = FALSE, include.dirs = FALSE)

#combine tables

all.table <- data.frame()

for (it  in 1:length(df.list)){  
  tmp.table <- read.csv(file=df.list[[it]]) 
  all.table <- rbind(all.table, tmp.table)
}

# output the all.table and convert to the raster and nc file

write.csv(all.table, file="./df_table/combined_table.csv", row.names=FALSE)


library("sp")
library("raster")
library("rgdal") #readOGR


#conver dataframe to raster object 
raster.lulcc <- rasterFromXYZ(all.table, crs=sp::CRS("+init=epsg:3826"))
#save the ratser as netCDf file
writeRaster(raster.lulcc, paste("./df_table/","comined_lulcc_500m_twd97.nc",sep=""), 
        overwrite=TRUE, format="CDF", varname="LU", varunit="fraction", 
	longname="Landuse/cover type derived from SPOT images 6m and upscale to 500m grid, Forest=1, Builtup=2, Water=3, Agri=4, Unkn.=5 ",
	xname="x", yname="y", zname="Coverage")




