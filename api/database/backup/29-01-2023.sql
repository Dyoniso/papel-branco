PGDMP         	                 {            Overnews %   12.13 (Ubuntu 12.13-0ubuntu0.20.04.1) %   12.13 (Ubuntu 12.13-0ubuntu0.20.04.1) &    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    32947    Overnews    DATABASE     |   CREATE DATABASE "Overnews" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE "Overnews";
                postgres    false            �            1259    32976    ARTG_CATEGORY    TABLE     �   CREATE TABLE public."ARTG_CATEGORY" (
    "ID_CATEGORY" integer NOT NULL,
    "CONTENT" text NOT NULL,
    "CREATED" date DEFAULT CURRENT_DATE NOT NULL,
    "UPDATED" date DEFAULT CURRENT_DATE NOT NULL
);
 #   DROP TABLE public."ARTG_CATEGORY";
       public         heap    postgres    false            �            1259    32974    ARTG_CATEGORY_ID_CATEGORY_seq    SEQUENCE     �   CREATE SEQUENCE public."ARTG_CATEGORY_ID_CATEGORY_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public."ARTG_CATEGORY_ID_CATEGORY_seq";
       public          postgres    false    203            �           0    0    ARTG_CATEGORY_ID_CATEGORY_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public."ARTG_CATEGORY_ID_CATEGORY_seq" OWNED BY public."ARTG_CATEGORY"."ID_CATEGORY";
          public          postgres    false    202            �            1259    32989    ARTICLE    TABLE     g  CREATE TABLE public."ARTICLE" (
    "ID_ARTICLE" integer NOT NULL,
    "ID_CATEGORY" integer NOT NULL,
    "GPT_ID" numeric NOT NULL,
    "TITLE" character varying(200) NOT NULL,
    "CONTENT" text NOT NULL,
    "PAGE_PATH" character varying(200) NOT NULL,
    "CREATED" date DEFAULT CURRENT_DATE NOT NULL,
    "UPDATED" date DEFAULT CURRENT_DATE NOT NULL
);
    DROP TABLE public."ARTICLE";
       public         heap    postgres    false            �            1259    33025    ARTICLE_FILE    TABLE     �   CREATE TABLE public."ARTICLE_FILE" (
    "ID_ARTICLE_FILE" integer NOT NULL,
    "ID_FILE" integer NOT NULL,
    "ID_ARTICLE" integer NOT NULL
);
 "   DROP TABLE public."ARTICLE_FILE";
       public         heap    postgres    false            �            1259    33023     ARTICLE_FILE_ID_ARTICLE_FILE_seq    SEQUENCE     �   CREATE SEQUENCE public."ARTICLE_FILE_ID_ARTICLE_FILE_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public."ARTICLE_FILE_ID_ARTICLE_FILE_seq";
       public          postgres    false    209            �           0    0     ARTICLE_FILE_ID_ARTICLE_FILE_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public."ARTICLE_FILE_ID_ARTICLE_FILE_seq" OWNED BY public."ARTICLE_FILE"."ID_ARTICLE_FILE";
          public          postgres    false    208            �            1259    32987    ARTICLE_ID_ARTICLE_seq    SEQUENCE     �   CREATE SEQUENCE public."ARTICLE_ID_ARTICLE_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."ARTICLE_ID_ARTICLE_seq";
       public          postgres    false    205            �           0    0    ARTICLE_ID_ARTICLE_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public."ARTICLE_ID_ARTICLE_seq" OWNED BY public."ARTICLE"."ID_ARTICLE";
          public          postgres    false    204            �            1259    33015    FILE    TABLE     1  CREATE TABLE public."FILE" (
    "ID_FILE" integer NOT NULL,
    "FILENAME" character varying(200) NOT NULL,
    "SV_PATH" character varying(200) NOT NULL,
    "MIMETYPE" character varying(30) NOT NULL,
    "CREATED" date DEFAULT CURRENT_DATE NOT NULL,
    "UPDATED" date DEFAULT CURRENT_DATE NOT NULL
);
    DROP TABLE public."FILE";
       public         heap    postgres    false            �            1259    33013    ASSETS_ID_FILE_seq    SEQUENCE     �   CREATE SEQUENCE public."ASSETS_ID_FILE_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."ASSETS_ID_FILE_seq";
       public          postgres    false    207            �           0    0    ASSETS_ID_FILE_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."ASSETS_ID_FILE_seq" OWNED BY public."FILE"."ID_FILE";
          public          postgres    false    206            $           2604    32979    ARTG_CATEGORY ID_CATEGORY    DEFAULT     �   ALTER TABLE ONLY public."ARTG_CATEGORY" ALTER COLUMN "ID_CATEGORY" SET DEFAULT nextval('public."ARTG_CATEGORY_ID_CATEGORY_seq"'::regclass);
 L   ALTER TABLE public."ARTG_CATEGORY" ALTER COLUMN "ID_CATEGORY" DROP DEFAULT;
       public          postgres    false    202    203    203            '           2604    32992    ARTICLE ID_ARTICLE    DEFAULT     ~   ALTER TABLE ONLY public."ARTICLE" ALTER COLUMN "ID_ARTICLE" SET DEFAULT nextval('public."ARTICLE_ID_ARTICLE_seq"'::regclass);
 E   ALTER TABLE public."ARTICLE" ALTER COLUMN "ID_ARTICLE" DROP DEFAULT;
       public          postgres    false    204    205    205            -           2604    33028    ARTICLE_FILE ID_ARTICLE_FILE    DEFAULT     �   ALTER TABLE ONLY public."ARTICLE_FILE" ALTER COLUMN "ID_ARTICLE_FILE" SET DEFAULT nextval('public."ARTICLE_FILE_ID_ARTICLE_FILE_seq"'::regclass);
 O   ALTER TABLE public."ARTICLE_FILE" ALTER COLUMN "ID_ARTICLE_FILE" DROP DEFAULT;
       public          postgres    false    208    209    209            *           2604    33018    FILE ID_FILE    DEFAULT     t   ALTER TABLE ONLY public."FILE" ALTER COLUMN "ID_FILE" SET DEFAULT nextval('public."ASSETS_ID_FILE_seq"'::regclass);
 ?   ALTER TABLE public."FILE" ALTER COLUMN "ID_FILE" DROP DEFAULT;
       public          postgres    false    207    206    207            �          0    32976    ARTG_CATEGORY 
   TABLE DATA           Y   COPY public."ARTG_CATEGORY" ("ID_CATEGORY", "CONTENT", "CREATED", "UPDATED") FROM stdin;
    public          postgres    false    203   H.       �          0    32989    ARTICLE 
   TABLE DATA           �   COPY public."ARTICLE" ("ID_ARTICLE", "ID_CATEGORY", "GPT_ID", "TITLE", "CONTENT", "PAGE_PATH", "CREATED", "UPDATED") FROM stdin;
    public          postgres    false    205   e.       �          0    33025    ARTICLE_FILE 
   TABLE DATA           T   COPY public."ARTICLE_FILE" ("ID_ARTICLE_FILE", "ID_FILE", "ID_ARTICLE") FROM stdin;
    public          postgres    false    209   �.       �          0    33015    FILE 
   TABLE DATA           d   COPY public."FILE" ("ID_FILE", "FILENAME", "SV_PATH", "MIMETYPE", "CREATED", "UPDATED") FROM stdin;
    public          postgres    false    207   �.       �           0    0    ARTG_CATEGORY_ID_CATEGORY_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public."ARTG_CATEGORY_ID_CATEGORY_seq"', 1, false);
          public          postgres    false    202            �           0    0     ARTICLE_FILE_ID_ARTICLE_FILE_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public."ARTICLE_FILE_ID_ARTICLE_FILE_seq"', 1, false);
          public          postgres    false    208            �           0    0    ARTICLE_ID_ARTICLE_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."ARTICLE_ID_ARTICLE_seq"', 1, false);
          public          postgres    false    204            �           0    0    ASSETS_ID_FILE_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."ASSETS_ID_FILE_seq"', 1, false);
          public          postgres    false    206            /           2606    32986 !   ARTG_CATEGORY ARTG_CATEGORY_pkey1 
   CONSTRAINT     n   ALTER TABLE ONLY public."ARTG_CATEGORY"
    ADD CONSTRAINT "ARTG_CATEGORY_pkey1" PRIMARY KEY ("ID_CATEGORY");
 O   ALTER TABLE ONLY public."ARTG_CATEGORY" DROP CONSTRAINT "ARTG_CATEGORY_pkey1";
       public            postgres    false    203            6           2606    33030    ARTICLE_FILE ARTICLE_FILE_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public."ARTICLE_FILE"
    ADD CONSTRAINT "ARTICLE_FILE_pkey" PRIMARY KEY ("ID_ARTICLE_FILE");
 L   ALTER TABLE ONLY public."ARTICLE_FILE" DROP CONSTRAINT "ARTICLE_FILE_pkey";
       public            postgres    false    209            1           2606    32999    ARTICLE ARTICLE_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."ARTICLE"
    ADD CONSTRAINT "ARTICLE_pkey" PRIMARY KEY ("ID_ARTICLE");
 B   ALTER TABLE ONLY public."ARTICLE" DROP CONSTRAINT "ARTICLE_pkey";
       public            postgres    false    205            4           2606    33022    FILE ASSETS_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public."FILE"
    ADD CONSTRAINT "ASSETS_pkey" PRIMARY KEY ("ID_FILE");
 >   ALTER TABLE ONLY public."FILE" DROP CONSTRAINT "ASSETS_pkey";
       public            postgres    false    207            7           1259    33042    fki_ARTG_FILE_ID_FILE_FK    INDEX     Z   CREATE INDEX "fki_ARTG_FILE_ID_FILE_FK" ON public."ARTICLE_FILE" USING btree ("ID_FILE");
 .   DROP INDEX public."fki_ARTG_FILE_ID_FILE_FK";
       public            postgres    false    209            2           1259    33012    fki_ARTG_ID_CATEGORY_FK    INDEX     X   CREATE INDEX "fki_ARTG_ID_CATEGORY_FK" ON public."ARTICLE" USING btree ("ID_CATEGORY");
 -   DROP INDEX public."fki_ARTG_ID_CATEGORY_FK";
       public            postgres    false    205            8           1259    33036    fki_ATG_FILE_ID_ARTICLE    INDEX     \   CREATE INDEX "fki_ATG_FILE_ID_ARTICLE" ON public."ARTICLE_FILE" USING btree ("ID_ARTICLE");
 -   DROP INDEX public."fki_ATG_FILE_ID_ARTICLE";
       public            postgres    false    209            ;           2606    33031 !   ARTICLE_FILE ARTG_FILE_ID_ARTICLE    FK CONSTRAINT     �   ALTER TABLE ONLY public."ARTICLE_FILE"
    ADD CONSTRAINT "ARTG_FILE_ID_ARTICLE" FOREIGN KEY ("ID_ARTICLE") REFERENCES public."ARTICLE"("ID_ARTICLE") NOT VALID;
 O   ALTER TABLE ONLY public."ARTICLE_FILE" DROP CONSTRAINT "ARTG_FILE_ID_ARTICLE";
       public          postgres    false    2865    209    205            :           2606    33037 !   ARTICLE_FILE ARTG_FILE_ID_FILE_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public."ARTICLE_FILE"
    ADD CONSTRAINT "ARTG_FILE_ID_FILE_FK" FOREIGN KEY ("ID_FILE") REFERENCES public."FILE"("ID_FILE") NOT VALID;
 O   ALTER TABLE ONLY public."ARTICLE_FILE" DROP CONSTRAINT "ARTG_FILE_ID_FILE_FK";
       public          postgres    false    209    2868    207            9           2606    33007    ARTICLE ARTG_ID_CATEGORY_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public."ARTICLE"
    ADD CONSTRAINT "ARTG_ID_CATEGORY_FK" FOREIGN KEY ("ID_CATEGORY") REFERENCES public."ARTG_CATEGORY"("ID_CATEGORY") NOT VALID;
 I   ALTER TABLE ONLY public."ARTICLE" DROP CONSTRAINT "ARTG_ID_CATEGORY_FK";
       public          postgres    false    2863    203    205            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     