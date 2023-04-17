--
-- PostgreSQL database dump
--

-- Dumped from database version 15.0
-- Dumped by pg_dump version 15.0

-- Started on 2023-04-17 15:46:59

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3993 (class 0 OID 21052)
-- Dependencies: 248
-- Data for Name: assignment_status; Type: TABLE DATA; Schema: public; Owner: *
--

INSERT INTO public.assignment_status VALUES (1, 'open');
INSERT INTO public.assignment_status VALUES (2, 'closed');
INSERT INTO public.assignment_status VALUES (3, 'completed');
INSERT INTO public.assignment_status VALUES (4, 'todo_urgent');
INSERT INTO public.assignment_status VALUES (5, 'todo');


--
-- TOC entry 3995 (class 0 OID 21060)
-- Dependencies: 250
-- Data for Name: assignment_types; Type: TABLE DATA; Schema: public; Owner: *
--

INSERT INTO public.assignment_types VALUES (1, 'testplan_tcversions', 'testcase_execution');
INSERT INTO public.assignment_types VALUES (2, 'tcversions', 'testcase_review');


--
-- TOC entry 3997 (class 0 OID 21069)
-- Dependencies: 252
-- Data for Name: attachments; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 3960 (class 0 OID 20602)
-- Dependencies: 215
-- Data for Name: node_types; Type: TABLE DATA; Schema: public; Owner: *
--

INSERT INTO public.node_types VALUES (1, 'testproject');
INSERT INTO public.node_types VALUES (2, 'testsuite');
INSERT INTO public.node_types VALUES (3, 'testcase');
INSERT INTO public.node_types VALUES (4, 'testcase_version');
INSERT INTO public.node_types VALUES (5, 'testplan');
INSERT INTO public.node_types VALUES (6, 'requirement_spec');
INSERT INTO public.node_types VALUES (7, 'requirement');
INSERT INTO public.node_types VALUES (8, 'requirement_version');
INSERT INTO public.node_types VALUES (9, 'testcase_step');
INSERT INTO public.node_types VALUES (10, 'requirement_revision');
INSERT INTO public.node_types VALUES (11, 'requirement_spec_revision');
INSERT INTO public.node_types VALUES (12, 'build');
INSERT INTO public.node_types VALUES (13, 'platform');
INSERT INTO public.node_types VALUES (14, 'user');


--
-- TOC entry 3962 (class 0 OID 20610)
-- Dependencies: 217
-- Data for Name: nodes_hierarchy; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 3986 (class 0 OID 20908)
-- Dependencies: 241
-- Data for Name: testprojects; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 4030 (class 0 OID 21481)
-- Dependencies: 285
-- Data for Name: platforms; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 3973 (class 0 OID 20736)
-- Dependencies: 228
-- Data for Name: testplans; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 4059 (class 0 OID 21834)
-- Dependencies: 314
-- Data for Name: baseline_l1l2_context; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 4019 (class 0 OID 21343)
-- Dependencies: 274
-- Data for Name: testsuites; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 4061 (class 0 OID 21855)
-- Dependencies: 316
-- Data for Name: baseline_l1l2_details; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 3975 (class 0 OID 20757)
-- Dependencies: 230
-- Data for Name: builds; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 3985 (class 0 OID 20885)
-- Dependencies: 240
-- Data for Name: custom_fields; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 4045 (class 0 OID 21673)
-- Dependencies: 300
-- Data for Name: cfield_build_design_values; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 3988 (class 0 OID 20959)
-- Dependencies: 243
-- Data for Name: cfield_design_values; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 3968 (class 0 OID 20652)
-- Dependencies: 223
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: *
--

INSERT INTO public.roles VALUES (3, '<no rights>', NULL);
INSERT INTO public.roles VALUES (4, 'test designer', NULL);
INSERT INTO public.roles VALUES (5, 'guest', NULL);
INSERT INTO public.roles VALUES (6, 'senior tester', NULL);
INSERT INTO public.roles VALUES (7, 'tester', NULL);
INSERT INTO public.roles VALUES (8, 'admin', NULL);
INSERT INTO public.roles VALUES (9, 'leader', NULL);


--
-- TOC entry 3970 (class 0 OID 20663)
-- Dependencies: 225
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: *
--

INSERT INTO public.users VALUES (1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 8, '', 'Testlink', 'Administrator', 'en_GB', NULL, 1, NULL, '0161ec99b4a65dec26fa8d7050642b3421232f297a57a5a743894a0e4a801fc3', '', '2023-04-17 15:43:47.917385', NULL);


--
-- TOC entry 3971 (class 0 OID 20689)
-- Dependencies: 226
-- Data for Name: tcversions; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 3977 (class 0 OID 20778)
-- Dependencies: 232
-- Data for Name: executions; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 3989 (class 0 OID 20980)
-- Dependencies: 244
-- Data for Name: cfield_execution_values; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 3991 (class 0 OID 21033)
-- Dependencies: 246
-- Data for Name: cfield_node_types; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 3983 (class 0 OID 20861)
-- Dependencies: 238
-- Data for Name: testplan_tcversions; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 3990 (class 0 OID 21012)
-- Dependencies: 245
-- Data for Name: cfield_testplan_design_values; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 3987 (class 0 OID 20935)
-- Dependencies: 242
-- Data for Name: cfield_testprojects; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 4054 (class 0 OID 21779)
-- Dependencies: 309
-- Data for Name: codetrackers; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 3998 (class 0 OID 21088)
-- Dependencies: 253
-- Data for Name: db_version; Type: TABLE DATA; Schema: public; Owner: *
--

INSERT INTO public.db_version VALUES ('DB 1.9.20', '2023-04-17 15:43:47.879395', 'TestLink 1.9.20 Raijin');


--
-- TOC entry 3966 (class 0 OID 20638)
-- Dependencies: 221
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 3999 (class 0 OID 21097)
-- Dependencies: 254
-- Data for Name: execution_bugs; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 3972 (class 0 OID 20720)
-- Dependencies: 227
-- Data for Name: tcsteps; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 3979 (class 0 OID 20812)
-- Dependencies: 234
-- Data for Name: execution_tcsteps; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 3981 (class 0 OID 20835)
-- Dependencies: 236
-- Data for Name: execution_tcsteps_wip; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 4034 (class 0 OID 21516)
-- Dependencies: 289
-- Data for Name: inventory; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 4040 (class 0 OID 21618)
-- Dependencies: 295
-- Data for Name: issuetrackers; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 4002 (class 0 OID 21122)
-- Dependencies: 257
-- Data for Name: keywords; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 4004 (class 0 OID 21141)
-- Dependencies: 259
-- Data for Name: milestones; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 4006 (class 0 OID 21160)
-- Dependencies: 261
-- Data for Name: object_keywords; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 4050 (class 0 OID 21744)
-- Dependencies: 305
-- Data for Name: plugins; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 4052 (class 0 OID 21758)
-- Dependencies: 307
-- Data for Name: plugins_configuration; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 4007 (class 0 OID 21175)
-- Dependencies: 262
-- Data for Name: req_specs; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 4009 (class 0 OID 21212)
-- Dependencies: 264
-- Data for Name: req_versions; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 4008 (class 0 OID 21194)
-- Dependencies: 263
-- Data for Name: requirements; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 4011 (class 0 OID 21234)
-- Dependencies: 266
-- Data for Name: req_coverage; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 4048 (class 0 OID 21721)
-- Dependencies: 303
-- Data for Name: req_monitor; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 4036 (class 0 OID 21539)
-- Dependencies: 291
-- Data for Name: req_relations; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 4037 (class 0 OID 21564)
-- Dependencies: 292
-- Data for Name: req_revisions; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 4038 (class 0 OID 21592)
-- Dependencies: 293
-- Data for Name: req_specs_revisions; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 4043 (class 0 OID 21646)
-- Dependencies: 298
-- Data for Name: reqmgrsystems; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 4013 (class 0 OID 21269)
-- Dependencies: 268
-- Data for Name: rights; Type: TABLE DATA; Schema: public; Owner: *
--

INSERT INTO public.rights VALUES (1, 'testplan_execute');
INSERT INTO public.rights VALUES (2, 'testplan_create_build');
INSERT INTO public.rights VALUES (3, 'testplan_metrics');
INSERT INTO public.rights VALUES (4, 'testplan_planning');
INSERT INTO public.rights VALUES (5, 'testplan_user_role_assignment');
INSERT INTO public.rights VALUES (6, 'mgt_view_tc');
INSERT INTO public.rights VALUES (7, 'mgt_modify_tc');
INSERT INTO public.rights VALUES (8, 'mgt_view_key');
INSERT INTO public.rights VALUES (9, 'mgt_modify_key');
INSERT INTO public.rights VALUES (10, 'mgt_view_req');
INSERT INTO public.rights VALUES (11, 'mgt_modify_req');
INSERT INTO public.rights VALUES (12, 'mgt_modify_product');
INSERT INTO public.rights VALUES (13, 'mgt_users');
INSERT INTO public.rights VALUES (14, 'role_management');
INSERT INTO public.rights VALUES (15, 'user_role_assignment');
INSERT INTO public.rights VALUES (16, 'mgt_testplan_create');
INSERT INTO public.rights VALUES (17, 'cfield_view');
INSERT INTO public.rights VALUES (18, 'cfield_management');
INSERT INTO public.rights VALUES (19, 'system_configuration');
INSERT INTO public.rights VALUES (20, 'mgt_view_events');
INSERT INTO public.rights VALUES (21, 'mgt_view_usergroups');
INSERT INTO public.rights VALUES (22, 'events_mgt');
INSERT INTO public.rights VALUES (23, 'testproject_user_role_assignment');
INSERT INTO public.rights VALUES (24, 'platform_management');
INSERT INTO public.rights VALUES (25, 'platform_view');
INSERT INTO public.rights VALUES (26, 'project_inventory_management');
INSERT INTO public.rights VALUES (27, 'project_inventory_view');
INSERT INTO public.rights VALUES (28, 'req_tcase_link_management');
INSERT INTO public.rights VALUES (29, 'keyword_assignment');
INSERT INTO public.rights VALUES (30, 'mgt_unfreeze_req');
INSERT INTO public.rights VALUES (31, 'issuetracker_management');
INSERT INTO public.rights VALUES (32, 'issuetracker_view');
INSERT INTO public.rights VALUES (33, 'reqmgrsystem_management');
INSERT INTO public.rights VALUES (34, 'reqmgrsystem_view');
INSERT INTO public.rights VALUES (35, 'exec_edit_notes');
INSERT INTO public.rights VALUES (36, 'exec_delete');
INSERT INTO public.rights VALUES (37, 'testplan_unlink_executed_testcases');
INSERT INTO public.rights VALUES (38, 'testproject_delete_executed_testcases');
INSERT INTO public.rights VALUES (39, 'testproject_edit_executed_testcases');
INSERT INTO public.rights VALUES (40, 'testplan_milestone_overview');
INSERT INTO public.rights VALUES (41, 'exec_testcases_assigned_to_me');
INSERT INTO public.rights VALUES (42, 'testproject_metrics_dashboard');
INSERT INTO public.rights VALUES (43, 'testplan_add_remove_platforms');
INSERT INTO public.rights VALUES (44, 'testplan_update_linked_testcase_versions');
INSERT INTO public.rights VALUES (45, 'testplan_set_urgent_testcases');
INSERT INTO public.rights VALUES (46, 'testplan_show_testcases_newest_versions');
INSERT INTO public.rights VALUES (47, 'testcase_freeze');
INSERT INTO public.rights VALUES (48, 'mgt_plugins');
INSERT INTO public.rights VALUES (49, 'exec_ro_access');
INSERT INTO public.rights VALUES (50, 'monitor_requirement');
INSERT INTO public.rights VALUES (51, 'codetracker_management');
INSERT INTO public.rights VALUES (52, 'codetracker_view');
INSERT INTO public.rights VALUES (53, 'cfield_assignment');
INSERT INTO public.rights VALUES (54, 'exec_assign_testcases');
INSERT INTO public.rights VALUES (55, 'testproject_add_remove_keywords_executed_tcversions');
INSERT INTO public.rights VALUES (56, 'delete_frozen_tcversion');


--
-- TOC entry 4015 (class 0 OID 21278)
-- Dependencies: 270
-- Data for Name: risk_assignments; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 4016 (class 0 OID 21299)
-- Dependencies: 271
-- Data for Name: role_rights; Type: TABLE DATA; Schema: public; Owner: *
--

INSERT INTO public.role_rights VALUES (8, 1);
INSERT INTO public.role_rights VALUES (8, 2);
INSERT INTO public.role_rights VALUES (8, 3);
INSERT INTO public.role_rights VALUES (8, 4);
INSERT INTO public.role_rights VALUES (8, 5);
INSERT INTO public.role_rights VALUES (8, 6);
INSERT INTO public.role_rights VALUES (8, 7);
INSERT INTO public.role_rights VALUES (8, 8);
INSERT INTO public.role_rights VALUES (8, 9);
INSERT INTO public.role_rights VALUES (8, 10);
INSERT INTO public.role_rights VALUES (8, 11);
INSERT INTO public.role_rights VALUES (8, 12);
INSERT INTO public.role_rights VALUES (8, 13);
INSERT INTO public.role_rights VALUES (8, 14);
INSERT INTO public.role_rights VALUES (8, 15);
INSERT INTO public.role_rights VALUES (8, 16);
INSERT INTO public.role_rights VALUES (8, 17);
INSERT INTO public.role_rights VALUES (8, 18);
INSERT INTO public.role_rights VALUES (8, 19);
INSERT INTO public.role_rights VALUES (8, 20);
INSERT INTO public.role_rights VALUES (8, 21);
INSERT INTO public.role_rights VALUES (8, 22);
INSERT INTO public.role_rights VALUES (8, 23);
INSERT INTO public.role_rights VALUES (8, 24);
INSERT INTO public.role_rights VALUES (8, 25);
INSERT INTO public.role_rights VALUES (8, 26);
INSERT INTO public.role_rights VALUES (8, 27);
INSERT INTO public.role_rights VALUES (8, 28);
INSERT INTO public.role_rights VALUES (8, 29);
INSERT INTO public.role_rights VALUES (8, 30);
INSERT INTO public.role_rights VALUES (8, 31);
INSERT INTO public.role_rights VALUES (8, 33);
INSERT INTO public.role_rights VALUES (8, 35);
INSERT INTO public.role_rights VALUES (8, 36);
INSERT INTO public.role_rights VALUES (8, 37);
INSERT INTO public.role_rights VALUES (8, 38);
INSERT INTO public.role_rights VALUES (8, 39);
INSERT INTO public.role_rights VALUES (8, 40);
INSERT INTO public.role_rights VALUES (8, 41);
INSERT INTO public.role_rights VALUES (8, 42);
INSERT INTO public.role_rights VALUES (8, 43);
INSERT INTO public.role_rights VALUES (8, 44);
INSERT INTO public.role_rights VALUES (8, 45);
INSERT INTO public.role_rights VALUES (8, 46);
INSERT INTO public.role_rights VALUES (8, 47);
INSERT INTO public.role_rights VALUES (8, 48);
INSERT INTO public.role_rights VALUES (8, 50);
INSERT INTO public.role_rights VALUES (8, 51);
INSERT INTO public.role_rights VALUES (8, 52);
INSERT INTO public.role_rights VALUES (8, 53);
INSERT INTO public.role_rights VALUES (8, 54);
INSERT INTO public.role_rights VALUES (5, 3);
INSERT INTO public.role_rights VALUES (5, 6);
INSERT INTO public.role_rights VALUES (5, 8);
INSERT INTO public.role_rights VALUES (4, 3);
INSERT INTO public.role_rights VALUES (4, 6);
INSERT INTO public.role_rights VALUES (4, 7);
INSERT INTO public.role_rights VALUES (4, 8);
INSERT INTO public.role_rights VALUES (4, 9);
INSERT INTO public.role_rights VALUES (4, 10);
INSERT INTO public.role_rights VALUES (4, 11);
INSERT INTO public.role_rights VALUES (4, 28);
INSERT INTO public.role_rights VALUES (4, 29);
INSERT INTO public.role_rights VALUES (4, 30);
INSERT INTO public.role_rights VALUES (4, 50);
INSERT INTO public.role_rights VALUES (7, 1);
INSERT INTO public.role_rights VALUES (7, 3);
INSERT INTO public.role_rights VALUES (7, 6);
INSERT INTO public.role_rights VALUES (7, 8);
INSERT INTO public.role_rights VALUES (6, 1);
INSERT INTO public.role_rights VALUES (6, 2);
INSERT INTO public.role_rights VALUES (6, 3);
INSERT INTO public.role_rights VALUES (6, 6);
INSERT INTO public.role_rights VALUES (6, 7);
INSERT INTO public.role_rights VALUES (6, 8);
INSERT INTO public.role_rights VALUES (6, 9);
INSERT INTO public.role_rights VALUES (6, 11);
INSERT INTO public.role_rights VALUES (6, 25);
INSERT INTO public.role_rights VALUES (6, 27);
INSERT INTO public.role_rights VALUES (6, 28);
INSERT INTO public.role_rights VALUES (6, 29);
INSERT INTO public.role_rights VALUES (6, 30);
INSERT INTO public.role_rights VALUES (6, 50);
INSERT INTO public.role_rights VALUES (9, 1);
INSERT INTO public.role_rights VALUES (9, 2);
INSERT INTO public.role_rights VALUES (9, 3);
INSERT INTO public.role_rights VALUES (9, 4);
INSERT INTO public.role_rights VALUES (9, 5);
INSERT INTO public.role_rights VALUES (9, 6);
INSERT INTO public.role_rights VALUES (9, 7);
INSERT INTO public.role_rights VALUES (9, 8);
INSERT INTO public.role_rights VALUES (9, 9);
INSERT INTO public.role_rights VALUES (9, 10);
INSERT INTO public.role_rights VALUES (9, 11);
INSERT INTO public.role_rights VALUES (9, 15);
INSERT INTO public.role_rights VALUES (9, 16);
INSERT INTO public.role_rights VALUES (9, 24);
INSERT INTO public.role_rights VALUES (9, 25);
INSERT INTO public.role_rights VALUES (9, 26);
INSERT INTO public.role_rights VALUES (9, 27);
INSERT INTO public.role_rights VALUES (9, 28);
INSERT INTO public.role_rights VALUES (9, 29);
INSERT INTO public.role_rights VALUES (9, 30);
INSERT INTO public.role_rights VALUES (9, 47);
INSERT INTO public.role_rights VALUES (9, 50);


--
-- TOC entry 4018 (class 0 OID 21317)
-- Dependencies: 273
-- Data for Name: testcase_keywords; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 4057 (class 0 OID 21807)
-- Dependencies: 312
-- Data for Name: testcase_platforms; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 4047 (class 0 OID 21695)
-- Dependencies: 302
-- Data for Name: testcase_relations; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 4000 (class 0 OID 21110)
-- Dependencies: 255
-- Data for Name: testcase_script_links; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 4032 (class 0 OID 21500)
-- Dependencies: 287
-- Data for Name: testplan_platforms; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 4055 (class 0 OID 21789)
-- Dependencies: 310
-- Data for Name: testproject_codetracker; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 4041 (class 0 OID 21628)
-- Dependencies: 296
-- Data for Name: testproject_issuetracker; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 4044 (class 0 OID 21656)
-- Dependencies: 299
-- Data for Name: testproject_reqmgrsystem; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 4025 (class 0 OID 21431)
-- Dependencies: 280
-- Data for Name: text_templates; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 3964 (class 0 OID 20626)
-- Dependencies: 219
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 4021 (class 0 OID 21357)
-- Dependencies: 276
-- Data for Name: user_assignments; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 4027 (class 0 OID 21448)
-- Dependencies: 282
-- Data for Name: user_group; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 4028 (class 0 OID 21467)
-- Dependencies: 283
-- Data for Name: user_group_assign; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 4022 (class 0 OID 21384)
-- Dependencies: 277
-- Data for Name: user_testplan_roles; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 4023 (class 0 OID 21407)
-- Dependencies: 278
-- Data for Name: user_testproject_roles; Type: TABLE DATA; Schema: public; Owner: *
--



--
-- TOC entry 4067 (class 0 OID 0)
-- Dependencies: 247
-- Name: assignment_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: *
--

SELECT pg_catalog.setval('public.assignment_status_id_seq', 5, true);


--
-- TOC entry 4068 (class 0 OID 0)
-- Dependencies: 249
-- Name: assignment_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: *
--

SELECT pg_catalog.setval('public.assignment_types_id_seq', 2, true);


--
-- TOC entry 4069 (class 0 OID 0)
-- Dependencies: 251
-- Name: attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: *
--

SELECT pg_catalog.setval('public.attachments_id_seq', 1, false);


--
-- TOC entry 4070 (class 0 OID 0)
-- Dependencies: 313
-- Name: baseline_l1l2_context_id_seq; Type: SEQUENCE SET; Schema: public; Owner: *
--

SELECT pg_catalog.setval('public.baseline_l1l2_context_id_seq', 1, false);


--
-- TOC entry 4071 (class 0 OID 0)
-- Dependencies: 315
-- Name: baseline_l1l2_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: *
--

SELECT pg_catalog.setval('public.baseline_l1l2_details_id_seq', 1, false);


--
-- TOC entry 4072 (class 0 OID 0)
-- Dependencies: 229
-- Name: builds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: *
--

SELECT pg_catalog.setval('public.builds_id_seq', 1, false);


--
-- TOC entry 4073 (class 0 OID 0)
-- Dependencies: 308
-- Name: codetrackers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: *
--

SELECT pg_catalog.setval('public.codetrackers_id_seq', 1, false);


--
-- TOC entry 4074 (class 0 OID 0)
-- Dependencies: 239
-- Name: custom_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: *
--

SELECT pg_catalog.setval('public.custom_fields_id_seq', 1, false);


--
-- TOC entry 4075 (class 0 OID 0)
-- Dependencies: 220
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: *
--

SELECT pg_catalog.setval('public.events_id_seq', 1, false);


--
-- TOC entry 4076 (class 0 OID 0)
-- Dependencies: 233
-- Name: execution_tcsteps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: *
--

SELECT pg_catalog.setval('public.execution_tcsteps_id_seq', 1, false);


--
-- TOC entry 4077 (class 0 OID 0)
-- Dependencies: 235
-- Name: execution_tcsteps_wip_id_seq; Type: SEQUENCE SET; Schema: public; Owner: *
--

SELECT pg_catalog.setval('public.execution_tcsteps_wip_id_seq', 1, false);


--
-- TOC entry 4078 (class 0 OID 0)
-- Dependencies: 231
-- Name: executions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: *
--

SELECT pg_catalog.setval('public.executions_id_seq', 1, false);


--
-- TOC entry 4079 (class 0 OID 0)
-- Dependencies: 288
-- Name: inventory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: *
--

SELECT pg_catalog.setval('public.inventory_id_seq', 1, false);


--
-- TOC entry 4080 (class 0 OID 0)
-- Dependencies: 294
-- Name: issuetrackers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: *
--

SELECT pg_catalog.setval('public.issuetrackers_id_seq', 1, false);


--
-- TOC entry 4081 (class 0 OID 0)
-- Dependencies: 256
-- Name: keywords_id_seq; Type: SEQUENCE SET; Schema: public; Owner: *
--

SELECT pg_catalog.setval('public.keywords_id_seq', 1, false);


--
-- TOC entry 4082 (class 0 OID 0)
-- Dependencies: 258
-- Name: milestones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: *
--

SELECT pg_catalog.setval('public.milestones_id_seq', 1, false);


--
-- TOC entry 4083 (class 0 OID 0)
-- Dependencies: 214
-- Name: node_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: *
--

SELECT pg_catalog.setval('public.node_types_id_seq', 1, false);


--
-- TOC entry 4084 (class 0 OID 0)
-- Dependencies: 216
-- Name: nodes_hierarchy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: *
--

SELECT pg_catalog.setval('public.nodes_hierarchy_id_seq', 1, false);


--
-- TOC entry 4085 (class 0 OID 0)
-- Dependencies: 260
-- Name: object_keywords_id_seq; Type: SEQUENCE SET; Schema: public; Owner: *
--

SELECT pg_catalog.setval('public.object_keywords_id_seq', 1, false);


--
-- TOC entry 4086 (class 0 OID 0)
-- Dependencies: 284
-- Name: platforms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: *
--

SELECT pg_catalog.setval('public.platforms_id_seq', 1, false);


--
-- TOC entry 4087 (class 0 OID 0)
-- Dependencies: 306
-- Name: plugins_configuration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: *
--

SELECT pg_catalog.setval('public.plugins_configuration_id_seq', 1, false);


--
-- TOC entry 4088 (class 0 OID 0)
-- Dependencies: 304
-- Name: plugins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: *
--

SELECT pg_catalog.setval('public.plugins_id_seq', 1, false);


--
-- TOC entry 4089 (class 0 OID 0)
-- Dependencies: 265
-- Name: req_coverage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: *
--

SELECT pg_catalog.setval('public.req_coverage_id_seq', 1, false);


--
-- TOC entry 4090 (class 0 OID 0)
-- Dependencies: 290
-- Name: req_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: *
--

SELECT pg_catalog.setval('public.req_relations_id_seq', 1, false);


--
-- TOC entry 4091 (class 0 OID 0)
-- Dependencies: 297
-- Name: reqmgrsystems_id_seq; Type: SEQUENCE SET; Schema: public; Owner: *
--

SELECT pg_catalog.setval('public.reqmgrsystems_id_seq', 1, false);


--
-- TOC entry 4092 (class 0 OID 0)
-- Dependencies: 267
-- Name: rights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: *
--

SELECT pg_catalog.setval('public.rights_id_seq', 1, false);


--
-- TOC entry 4093 (class 0 OID 0)
-- Dependencies: 269
-- Name: risk_assignments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: *
--

SELECT pg_catalog.setval('public.risk_assignments_id_seq', 1, false);


--
-- TOC entry 4094 (class 0 OID 0)
-- Dependencies: 222
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: *
--

SELECT pg_catalog.setval('public.roles_id_seq', 9, true);


--
-- TOC entry 4095 (class 0 OID 0)
-- Dependencies: 272
-- Name: testcase_keywords_id_seq; Type: SEQUENCE SET; Schema: public; Owner: *
--

SELECT pg_catalog.setval('public.testcase_keywords_id_seq', 1, false);


--
-- TOC entry 4096 (class 0 OID 0)
-- Dependencies: 311
-- Name: testcase_platforms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: *
--

SELECT pg_catalog.setval('public.testcase_platforms_id_seq', 1, false);


--
-- TOC entry 4097 (class 0 OID 0)
-- Dependencies: 301
-- Name: testcase_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: *
--

SELECT pg_catalog.setval('public.testcase_relations_id_seq', 1, false);


--
-- TOC entry 4098 (class 0 OID 0)
-- Dependencies: 286
-- Name: testplan_platforms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: *
--

SELECT pg_catalog.setval('public.testplan_platforms_id_seq', 1, false);


--
-- TOC entry 4099 (class 0 OID 0)
-- Dependencies: 237
-- Name: testplan_tcversions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: *
--

SELECT pg_catalog.setval('public.testplan_tcversions_id_seq', 1, false);


--
-- TOC entry 4100 (class 0 OID 0)
-- Dependencies: 279
-- Name: text_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: *
--

SELECT pg_catalog.setval('public.text_templates_id_seq', 1, false);


--
-- TOC entry 4101 (class 0 OID 0)
-- Dependencies: 218
-- Name: transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: *
--

SELECT pg_catalog.setval('public.transactions_id_seq', 1, false);


--
-- TOC entry 4102 (class 0 OID 0)
-- Dependencies: 275
-- Name: user_assignments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: *
--

SELECT pg_catalog.setval('public.user_assignments_id_seq', 1, false);


--
-- TOC entry 4103 (class 0 OID 0)
-- Dependencies: 281
-- Name: user_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: *
--

SELECT pg_catalog.setval('public.user_group_id_seq', 1, false);


--
-- TOC entry 4104 (class 0 OID 0)
-- Dependencies: 224
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: *
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


-- Completed on 2023-04-17 15:46:59

--
-- PostgreSQL database dump complete
--

