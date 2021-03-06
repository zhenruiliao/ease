neuron.match_status.status(cell_id) = 1; 
neuron.match_status.em_ids{cell_id} = segment_ids(em_id); 
% set(gco, 'backgroundcolor', 'red'); 
% set(ease.gui.btn_em_candidate, 'backgroundcolor', ease.gui.color_gray); 
% set(ease.gui.btn_em_ignore, 'backgroundcolor', ease.gui.color_gray);
% set(ease.gui.btn_em_zero, 'backgroundcolor', ease.gui.color_gray); 
neuron.A_em(:, cell_id) = Aem(:, em_id); 
try
    temp = neuron.scores(cell_id, :);
    v_max = temp(em_id);
    temp(em_id) = -inf;
    neuron.match_status.confidence(cell_id) = v_max / max(temp);
catch 
    fprintf('confidence value has not been updated yet.\n'); 
end

cb_show_2p_neuron; 